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
#import "IPPlayable.h"

#import "IPGaussianBlurEngine.h"
#import "IPFontHelper.h"
#import "IPSimpleCell.h"
#import "IPSearchTabView.h"

#define songPosition 0
#define artistPosition 1
#define albumPosition 2

typedef void (^IPSelectedMediaQuery)(NSString *searchString);

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
    [self artistTabSelected];
    
    self.media = [IPMediaInspector getAllMediaGroupedByAlbum];
    NSMutableArray *albums = [NSMutableArray arrayWithCapacity:[self.media count]];
    [self.media enumerateObjectsUsingBlock:^(MPMediaItemCollection *itemCol, NSUInteger idx, BOOL *stop) {
        [albums addObject:[IPPlayable playableWithMediaItem:[itemCol representativeItem]]];
    }];
    self.media = albums;
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
    IPPlayable *playable = [self.media objectAtIndex:indexPath.row];
    [cell.titleLabel setText:playable.albumTitle];
    [cell.subtitleLabel setText:playable.artistName];
    [cell.albumArtImageView setImage:playable.albumArtworkThumbnail];
    return cell;
}

#pragma mark SearchBar delegate

-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    mediaQueryBlock(searchText);
}

#pragma mark SelectionTab methods

-(void) songTabSelected {
    selectedMediaForm = 0;
    __block IPSearchVC *blockSelf = self;
    mediaQueryBlock = ^(NSString *searchString){
        blockSelf.media = [IPMediaInspector getAllSongsWithSearchTitle:searchString];
        NSLog(@"Media %@", blockSelf.media);
        NSMutableArray *songs = [NSMutableArray arrayWithCapacity:[blockSelf.media count]];
        [blockSelf.media enumerateObjectsUsingBlock:^(MPMediaItemCollection *itemCol, NSUInteger idx, BOOL *stop) {
            [songs addObject:[IPPlayable playableWithMediaItem:[itemCol representativeItem]]];
        }];
        blockSelf.media = songs;
        [blockSelf.mediaTableView reloadData];
    };
}
-(void) artistTabSelected {
    selectedMediaForm = 1;
    __block IPSearchVC *blockSelf = self;
    mediaQueryBlock = ^(NSString *searchString){
        blockSelf.media = [IPMediaInspector getAllSongsWithSearchTitle:searchString];
        NSLog(@"Media %@", blockSelf.media);
        NSMutableArray *songs = [NSMutableArray arrayWithCapacity:[blockSelf.media count]];
        [blockSelf.media enumerateObjectsUsingBlock:^(MPMediaItemCollection *itemCol, NSUInteger idx, BOOL *stop) {
            [songs addObject:[IPPlayable playableWithMediaItem:[itemCol representativeItem]]];
        }];
        blockSelf.media = songs;
        [blockSelf.mediaTableView reloadData];
    };
}
-(void) albumTabSelected {
    selectedMediaForm = 2;
    __block IPSearchVC *blockSelf = self;
    mediaQueryBlock = ^(NSString *searchString){
        blockSelf.media = [IPMediaInspector getAllSongsWithSearchTitle:searchString];
        NSLog(@"Media %@", blockSelf.media);
        NSMutableArray *songs = [NSMutableArray arrayWithCapacity:[blockSelf.media count]];
        [blockSelf.media enumerateObjectsUsingBlock:^(MPMediaItemCollection *itemCol, NSUInteger idx, BOOL *stop) {
            [songs addObject:[IPPlayable playableWithMediaItem:[itemCol representativeItem]]];
        }];
        blockSelf.media = songs;
        [blockSelf.mediaTableView reloadData];
    };
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
