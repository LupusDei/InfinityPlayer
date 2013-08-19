//
//  IPScanViewController.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/18/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPScanViewController.h"
#import "IPMediaInspector.h"
#import "IPSongCVCell.h"
#import "UIImageView+GaussianBlur.h"

@interface IPScanViewController ()
@property (nonatomic, strong) NSArray *imageNames;
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
//    NSArray *items = [IPMediaInspector getAllMedia];
//    NSLog(@"items: %@", items);
    self.imageNames = @[@"kanye_album.png", @"marcusEatonAlbum.png", @"muse_the_resistance.png", @"743c90c1.jpg", @"born_sinner.jpeg"];
    self.currentSongCollectionView.delegate = self;
    self.currentSongCollectionView.dataSource = self;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IPSongCVCell *cell = [self.currentSongCollectionView dequeueReusableCellWithReuseIdentifier:@"SongCVCell" forIndexPath:indexPath];
    
    
    NSString *imageName = [self.imageNames objectAtIndex:indexPath.row];
    UIImage *backgroundImage = [UIImage imageNamed:imageName];
    UIImage *albumImage = [UIImage imageNamed:imageName];
    
    [cell.blurredBackgroundImageView setImage:backgroundImage];
    [cell.blurredBackgroundImageView applyGaussianBlurWithFactor:9 andExpandImageByFactor:2.0
     ];
    [cell.albumCoverImageView setImage:albumImage];
    
    return cell;
}


@end
