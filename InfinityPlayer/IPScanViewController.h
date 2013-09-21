//
//  IPScanViewController.h
//  InfinityPlayer
//
//  Created by Justin Martin on 8/18/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IPAbstractVC.h"

@interface IPScanViewController : IPAbstractVC <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *currentSongCollectionView;
@property (nonatomic, strong) NSArray *playables;

+(IPScanViewController *) playerVCWithPlayables:(NSArray *)playables;

@end
