//
//  IPSongCVCell.h
//  InfinityPlayer
//
//  Created by Justin Martin on 8/18/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IPProgressBarView.h"

@interface IPSongCVCell : UICollectionViewCell
@property (strong, nonatomic) UIImageView *blurredBackgroundImageView;
@property (strong, nonatomic) UIImageView *albumCoverImageView;
@property (strong, nonatomic) UILabel *songTitleLabel;
@property (strong, nonatomic) UILabel *artistLabel;
@property (nonatomic, strong) IPProgressBarView *progressBar;

@end
