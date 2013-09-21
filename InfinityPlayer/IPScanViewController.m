//
//  IPScanViewController.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/18/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPScanViewController.h"
#import "IPMediaInspector.h"
#import "IPMediaPlayer.h"
#import "IPPlayable.h"
#import "IPSongCVCell.h"

#import "UIImageView+GaussianBlur.h"

#define StoryboardID @"ScanViewController"

@interface IPScanViewController ()
@property (nonatomic, strong) NSArray *imageNames;
@property (nonatomic, strong) NSArray *mediaItemCollections;
@property (nonatomic, strong) UIImage *albumArtwork;
@property (nonatomic, strong) IPMediaPlayer *player;
@end

@implementation IPScanViewController {
}

+(IPScanViewController *) playerVCWithPlayables:(NSArray *)playables {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    IPScanViewController *vc = [storyboard instantiateViewControllerWithIdentifier:StoryboardID];
    vc.playables = playables;
    return vc;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.currentSongCollectionView.delegate = self;
    self.currentSongCollectionView.dataSource = self;
    [self.currentSongCollectionView registerClass:[IPSongCVCell class] forCellWithReuseIdentifier:SongCellID];
    
    self.player = [[IPMediaPlayer alloc] init];
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:[self.playables count]];
    [self.playables enumerateObjectsUsingBlock:^(IPPlayable *playable, NSUInteger idx, BOOL *stop) {
        [items addObject:playable.item];
    }];
    [self.player.myPlayer setQueueWithItemCollection:[MPMediaItemCollection collectionWithItems:items]];
    [self.player.myPlayer play];
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.playables count];
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IPSongCVCell *cell = [self.currentSongCollectionView dequeueReusableCellWithReuseIdentifier:SongCellID forIndexPath:indexPath];
    IPPlayable *playable = [self.playables objectAtIndex:indexPath.row];
    
    
    [cell.artistLabel setText:playable.artistName];
    [cell.songTitleLabel setText:playable.title];

    [cell.blurredBackgroundImageView setImage:[playable blurredAlbumArtworkScaledSize]];
    
    [cell.albumCoverImageView setImage:[playable albumArtworkDefaultSize]];

      [UIView animateWithDuration:20 animations:^{
        CGRect frame =CGRectMake(ipStandardWidth/2, cell.progressBar.y, cell.progressBar.width, cell.progressBar.height);
        cell.progressBar.frame = frame;
    }];
    return cell;
}


@end
