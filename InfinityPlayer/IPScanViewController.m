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

@interface IPScanViewController ()
@property (nonatomic, strong) NSArray *imageNames;
@property (nonatomic, strong) NSArray *mediaItemCollections;
@property (nonatomic, strong) NSMutableArray *playables;
@property (nonatomic, strong) UIImage *albumArtwork;
@property (nonatomic, strong) IPMediaPlayer *player;
@end

@implementation IPScanViewController

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
	// Do any additional setup after loading the view.
    self.mediaItemCollections = [IPMediaInspector getAllMediaGroupedByAlbum];
    self.playables = [NSMutableArray arrayWithCapacity:[self.mediaItemCollections count]];
    
    [self.mediaItemCollections enumerateObjectsUsingBlock:^(MPMediaItemCollection *itemCol, NSUInteger idx, BOOL *stop) {
        [[itemCol items] enumerateObjectsUsingBlock:^(MPMediaItem *item, NSUInteger idx, BOOL *stop) {
            [self.playables addObject:[IPPlayable playableWithMediaItem:item]];
        }];
    }];
    
    self.currentSongCollectionView.delegate = self;
    self.currentSongCollectionView.dataSource = self;
    [self.currentSongCollectionView registerClass:[IPSongCVCell class] forCellWithReuseIdentifier:SongCellID];
    
    self.player = [[IPMediaPlayer alloc] init];
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.playables count];
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IPSongCVCell *cell = [self.currentSongCollectionView dequeueReusableCellWithReuseIdentifier:SongCellID forIndexPath:indexPath];
    IPPlayable *playable = [self.playables objectAtIndex:indexPath.row];
    
    [self.player.myPlayer setQueueWithItemCollection:[MPMediaItemCollection collectionWithItems:@[playable.item]]];
//    [self.player.myPlayer play];
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
