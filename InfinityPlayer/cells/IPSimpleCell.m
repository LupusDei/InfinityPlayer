//
//  IPSimpleCell.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/5/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPSimpleCell.h"
#import "IPFontHelper.h"

@implementation IPSimpleCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    NSLog(@"Cell being called");
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(ipUnitSpacer + ipCellAlbumArtSize, self.contentView.height / 2 - ipCellTitleHeight, self.contentView.width - ipCellAlbumArtSize - ipUnitSpacer * 3, ipCellTitleHeight)];
        self.titleLabel.font = [IPFontHelper ipCellTitleFont];
        self.titleLabel.textColor = [UIColor whiteColor];
        
        self.subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(ipUnitSpacer + ipCellAlbumArtSize, self.titleLabel.height + self.titleLabel.y + ipUnitSpacer, self.contentView.width - ipCellAlbumArtSize - ipUnitSpacer * 3, ipCellSubtitleHeight)];
        self.subtitleLabel.font = [IPFontHelper ipCellSubtitleFont];
        self.subtitleLabel.textColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.subtitleLabel];
        
        NSLog(@"contentView:%@    titleLabel:%@   subtitleLbel:%@", NSStringFromCGRect(self.contentView.frame), NSStringFromCGRect(self.titleLabel.frame), NSStringFromCGRect(self.subtitleLabel.frame));
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
