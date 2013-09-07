//
//  IPSimpleCell.h
//  InfinityPlayer
//
//  Created by Justin Martin on 9/5/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SimpleCellID @"SimpleCell"

@interface IPSimpleCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *subtitleLabel;
@property (nonatomic, strong) IBOutlet UIImageView *albumArtImageView;

@end
