//
//  IPSearchVC.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/4/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPSearchVC.h"
#import <QuartzCore/QuartzCore.h>
#import "IPGaussianBlurEngine.h"
#import "IPFontHelper.h"
#import "IPSimpleCell.h"

#define songPosition 0
#define artistPosition 1
#define albumPosition 2


@interface IPSearchVC ()

@end

@implementation IPSearchVC {
    UIImageView *backgroundImageView;
    UISearchBar *searchbar;
    UIView *sortContainer;
    UIView *selectionView;
    UIView *songSortTab;
    UIView *albumSortTab;
    UIView *artistSortTab;
    UITableView *mediaTableView;
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
    mediaTableView.delegate = self;
    mediaTableView.dataSource = self;
    [mediaTableView registerClass:[IPSimpleCell class] forCellReuseIdentifier:SimpleCellID];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setViewLayout {
    backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [backgroundImageView setContentMode:UIViewContentModeCenter];
    //TODO find real background image
    UIImage *image = [UIImage imageNamed:@"MurakKanye.png"];
    UIImage *blurred = [IPGaussianBlurEngine blurredImageFromImage:image withBlurFactor:ipMediumGaussianBlur andExplansionFactor:ipScaleFactor];
    [backgroundImageView setImage:blurred];
    
    searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(ipBackButtonWidth, ipStatusBarHeight, ipStandardWidth - ipBackButtonWidth * 2, ipNavbarHeight)];
    [searchbar setSearchBarStyle:UISearchBarStyleMinimal];
//    [searchbar setBackgroundImage:[UIImage imageNamed:@"searchInputBorder"]];
    
    sortContainer = [[UIView alloc] initWithFrame:CGRectMake(-1, searchbar.height + searchbar.y, ipStandardWidth + 2, ipNavbarHeight)];
    sortContainer.backgroundColor = [UIColor clearColor];
    
    songSortTab = [[UIView alloc] initWithFrame:CGRectMake(-1, 0, sortContainer.width / 3 + 1, ipNavbarHeight)];
    songSortTab.backgroundColor = [UIColor clearColor];
    songSortTab.layer.borderColor = [UIColor whiteColor].CGColor;
    songSortTab.layer.borderWidth = 0.5;
    UILabel *songLabel = [[UILabel alloc] initWithFrame:songSortTab.frame];
    [songLabel setText:@"Songs"];
    [songLabel setTextAlignment:NSTextAlignmentCenter];
    [songLabel setTextColor:[UIColor whiteColor]];
    [songLabel setFont:[IPFontHelper ipTitleFont]];
    songLabel.backgroundColor = [UIColor clearColor];
    [songSortTab addSubview:songLabel];
    
    
    artistSortTab = [[UIView alloc] initWithFrame:CGRectMake(songSortTab.x + songSortTab.width, 0, sortContainer.width / 3 + 1, ipNavbarHeight)];
    artistSortTab.backgroundColor = [UIColor clearColor];
    artistSortTab.layer.borderColor = [UIColor whiteColor].CGColor;
    artistSortTab.layer.borderWidth = 0.5;
    UILabel *artistLabel = [[UILabel alloc] initWithFrame:songSortTab.frame];
    [artistLabel setText:@"Artists"];
    [artistLabel setFont:[IPFontHelper ipTitleFont]];
    [artistLabel setTextAlignment:NSTextAlignmentCenter];
    [artistLabel setTextColor:[UIColor whiteColor]];
    artistLabel.backgroundColor = [UIColor clearColor];
    [artistSortTab addSubview:artistLabel];
    
    albumSortTab = [[UIView alloc] initWithFrame:CGRectMake(artistSortTab.x + artistSortTab.width, 0, sortContainer.width / 3 + 1, ipNavbarHeight)];
    albumSortTab.backgroundColor = [UIColor clearColor];
    albumSortTab.layer.borderColor = [UIColor whiteColor].CGColor;
    albumSortTab.layer.borderWidth = 0.5;
    UILabel *albumLabel = [[UILabel alloc] initWithFrame:songSortTab.frame];
    [albumLabel setText:@"Albums"];
    [albumLabel setFont:[IPFontHelper ipTitleFont]];
    [albumLabel setTextColor:[UIColor whiteColor]];
    [albumLabel setTextAlignment:NSTextAlignmentCenter];
    albumLabel.backgroundColor = [UIColor clearColor];
    [albumSortTab addSubview:albumLabel];
    
    selectionView = [[UIView alloc] initWithFrame:CGRectMake(artistSortTab.x, 0, sortContainer.width / 3 + 1, ipNavbarHeight)];
    selectionView.backgroundColor = [UIColor lightGrayColor];
    selectionView.alpha = 0.6;
    
    mediaTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, sortContainer.height + sortContainer.y, ipStandardWidth, self.view.height - ipNavbarHeight * 2)];
    mediaTableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:backgroundImageView];
    [self.view addSubview:searchbar];
    [self.view addSubview:sortContainer];
    [sortContainer addSubview:selectionView];
    [sortContainer addSubview:songSortTab];
    [sortContainer addSubview:artistSortTab];
    [sortContainer addSubview:albumSortTab];
    [self.view addSubview:mediaTableView];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IPSimpleCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleCellID forIndexPath:indexPath];
    if (indexPath.row == 0) {
        [cell.textLabel setText:@"Hello"];
        [cell.detailTextLabel setText:@"things"];
    }
    else {
        [cell.textLabel setText:@"Bye"];
                [cell.detailTextLabel setText:@"things"];
    }
    return cell;
}
@end
