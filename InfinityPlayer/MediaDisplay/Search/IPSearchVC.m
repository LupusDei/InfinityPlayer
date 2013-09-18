//
//  IPSearchVC.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/4/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPSearchVC.h"
#import <QuartzCore/QuartzCore.h>

#import "IPMediaInspector.h"

#import "IPGaussianBlurEngine.h"
#import "IPFontHelper.h"
#import "IPSimpleCell.h"
#import "IPSearchTabView.h"

#define songPosition 0
#define artistPosition 1
#define albumPosition 2

typedef void (^IPSelectedMediaQuery)(NSString *searchString);
typedef void (^IPMediaCellSetup)(IPSimpleCell *cell, id mediaItem);

@interface IPSearchVC ()
    @property (nonatomic, strong) UITableView *mediaTableView;
    @property (nonatomic, strong)     NSArray *media;
@end

@implementation IPSearchVC {
    UIImageView *backgroundImageView;
    UISearchBar *searchbar;
    IPSearchTabView *tabView;
    int selectedMediaForm;
    IPSelectedMediaQuery mediaQueryBlock;
    IPMediaCellSetup mediaCellSetupBlock;
    NSString *searchableString;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setViewLayout];
    self.mediaTableView.delegate = self;
    self.mediaTableView.dataSource = self;
//    [self.mediaTableView registerClass:[IPSimpleCell class] forCellReuseIdentifier:SimpleCellID];
    [self.mediaTableView registerNib:[UINib nibWithNibName:@"IPSimpleCell" bundle:nil] forCellReuseIdentifier:SimpleCellID];

    [searchbar setDelegate:self];
    selectedMediaForm = 1;
    searchableString = @"";
    [self artistTabSelected];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView Stuff

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 54;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.media count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IPSimpleCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleCellID forIndexPath:indexPath];
    id mediaItem = [self.media objectAtIndex:indexPath.row];
    mediaCellSetupBlock(cell,mediaItem);
    return cell;
}

#pragma mark SearchBar delegate

-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchText hasSuffix:@"\\n"]) {
        [searchBar resignFirstResponder];
    }
    else {
        searchableString = searchText;
        mediaQueryBlock(searchableString);
    }
}

-(void) searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    searchableString = @"";
    searchBar.text = @"";
    mediaQueryBlock(searchableString);
}

#pragma mark SelectionTab methods

-(void) songTabSelected {
    selectedMediaForm = 0;
    __block IPSearchVC *blockSelf = self;
    mediaCellSetupBlock = ^(IPSimpleCell *cell, IPPlayable *playable) {
        [cell.titleLabel setText:playable.title];
        [cell.subtitleLabel setText:playable.artistName];
        cell.albumArtImageView.hidden = YES;
    };
    mediaQueryBlock = ^(NSString *searchString){
        blockSelf.media = [IPMediaInspector getAllSongsWithSearchTitle:searchString];
        [blockSelf.mediaTableView reloadData];
    };
    mediaQueryBlock(searchableString);
}
-(void) artistTabSelected {
    selectedMediaForm = 1;
    __block IPSearchVC *blockSelf = self;
    mediaCellSetupBlock = ^(IPSimpleCell *cell, IPArtist *artist) {
        [cell.titleLabel setText:artist.name];
        [cell.subtitleLabel setText:@""];
        cell.albumArtImageView.hidden = YES;
    };
    mediaQueryBlock = ^(NSString *searchString){
        blockSelf.media = [IPMediaInspector getAllArtistsWithSearchName:searchString];
        [blockSelf.mediaTableView reloadData];
    };
}
-(void) albumTabSelected {
    selectedMediaForm = 2;
    __block IPSearchVC *blockSelf = self;
    mediaCellSetupBlock = ^(IPSimpleCell *cell, IPAlbum *album) {
        [cell.titleLabel setText:album.title];
        [cell.subtitleLabel setText:album.artistName];
        cell.albumArtImageView.hidden = NO;
        [cell.albumArtImageView setImage:album.albumArtworkThumbnail];
    };
    mediaQueryBlock = ^(NSString *searchString){
        blockSelf.media = [IPMediaInspector getAllAlbumsWithSearchTitle:searchString];
        [blockSelf.mediaTableView reloadData];
    };
    mediaQueryBlock(searchableString);
}

-(void) setViewLayout {
    backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [backgroundImageView setContentMode:UIViewContentModeCenter];
    //TODO find real background image
    UIImage *image = [UIImage imageNamed:ipDefaultAlbumArtworkName];
    UIImage *blurred = [IPGaussianBlurEngine blurredImageFromImage:image withBlurFactor:ipMediumGaussianBlur andExplansionFactor:ipScaleFactor];
    [backgroundImageView setImage:blurred];
    
    searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(ipBackButtonWidth, ipStatusBarHeight, ipStandardWidth - ipBackButtonWidth * 2, ipNavbarHeight)];
    [searchbar setSearchBarStyle:UISearchBarStyleMinimal];
    
    tabView = [[IPSearchTabView alloc] initWithY:searchbar.y + searchbar.height];
    __block IPSearchVC *blockSelf = self;
    [tabView setActionForAlbumsButton:^{[blockSelf albumTabSelected];}];
    [tabView setActionForArtistsButton:^{[blockSelf artistTabSelected];}];
    [tabView setActionForSongsButton:^{[blockSelf songTabSelected];}];
    
    // Set actions for each of the tabs
    
    self.mediaTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tabView.height + tabView.y, ipStandardWidth, self.view.height - ipNavbarHeight * 2)];
    self.mediaTableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:backgroundImageView];
    [self.view addSubview:searchbar];
    [self.view addSubview:tabView];
    [self.view addSubview:self.mediaTableView];
}
@end
