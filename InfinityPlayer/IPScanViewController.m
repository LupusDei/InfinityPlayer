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
        NSLog(@"\n~~~~~~~~AnotherCol: %@ \n", itemCol);
        
        [[itemCol items] enumerateObjectsUsingBlock:^(MPMediaItem *item, NSUInteger idx, BOOL *stop) {
            NSLog(@"AnotherItem: %@   \n", item);
            [self.playables addObject:[IPPlayable playableWithMediaItem:item]];
        }];
    }];
    
    self.imageNames = @[@"chronic.png", @"drake-nothing-was-the-same-artwork-2.png", @"743c90c1.jpg", @"born_sinner.jpeg", @"MurakKanye.png"];
    self.currentSongCollectionView.delegate = self;
    self.currentSongCollectionView.dataSource = self;
    
    self.player = [[IPMediaPlayer alloc] init];
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.playables count];
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IPSongCVCell *cell = [self.currentSongCollectionView dequeueReusableCellWithReuseIdentifier:@"SongCVCell" forIndexPath:indexPath];
    IPPlayable *playable = [self.playables objectAtIndex:indexPath.row];
    
    [self.player.myPlayer setQueueWithItemCollection:[MPMediaItemCollection collectionWithItems:@[playable.item]]];
//    [self.player.myPlayer play];
    NSLog(@"Playable with item :%@", playable.item);
    [cell.artistLabel setText:playable.artistName];
    [cell.songTitleLabel setText:playable.title];
    UIImage *albumArt = [playable albumArtworkDefaultSize];
    if (albumArt) {
        [cell.blurredBackgroundImageView setImage:albumArt];
        [cell.albumCoverImageView setImage:albumArt];
    }
    else {
        NSString *imageName = [self.imageNames lastObject];
        UIImage *albumImage = [UIImage imageNamed:imageName];
        [cell.blurredBackgroundImageView setImage:albumImage];
        [cell.albumCoverImageView setImage:albumImage];
    }
    [cell.blurredBackgroundImageView applyGaussianBlurWithFactor:ipMediumGaussianBlur andExpandImageByFactor:2.2];
      [UIView animateWithDuration:5 animations:^{
        CGRect frame =CGRectMake(ipStandardWidth/2, cell.progressBar.y, cell.progressBar.width, cell.progressBar.height);
        cell.progressBar.frame = frame;
    }];
    return cell;
}


@end
