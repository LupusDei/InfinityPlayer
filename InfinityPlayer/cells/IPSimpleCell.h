//
//  IPSimpleCell.h
//  InfinityPlayer
//
//  Created by Justin Martin on 9/5/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SimpleCellID @"SimpleCell"
#define SimpleCellHeight 54

@interface IPSimpleCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *subtitleLabel;
@property (nonatomic, strong) IBOutlet UIImageView *albumArtImageView;

-(void) formatCellForArtistWithName:(NSString *)name;
-(void) formatCellForSongWithTitle:(NSString *)title andArtistName:(NSString *)name;
-(void) formatCellForAlbumWithTitle:(NSString *)title andArtistName:(NSString *)name;
@end
