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
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
        self.titleLabel.font = [IPFontHelper ipCellTitleFont];
        self.titleLabel.textColor = [UIColor whiteColor];
        
        self.subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,0,0)];
        self.subtitleLabel.font = [IPFontHelper ipCellSubtitleFont];
        self.subtitleLabel.textColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.subtitleLabel];
        [self useSimpleDetailFormat];
    }
    return self;
}

-(void) useSimpleDetailFormat {
    self.titleLabel.frame = CGRectMake(ipCellIndent, SimpleCellHeight / 2 - 2 - self.titleLabel.height, self.contentView.width - ipCellIndent - ipUnitSpacer, ipCellTitleHeight);
    self.subtitleLabel.frame = CGRectMake(ipCellIndent, SimpleCellHeight / 2 + 2, self.contentView.width - ipCellIndent - ipUnitSpacer, ipCellSubtitleHeight);
    self.subtitleLabel.hidden = NO;
}

-(void) formatCellForArtistWithName:(NSString *)name {
    [self.titleLabel setText:name];
    self.titleLabel.center = self.contentView.center;
    [self.titleLabel withX:ipCellIndent];
    
    self.subtitleLabel.hidden = YES;
}

-(void) formatCellForSongWithTitle:(NSString *)title andArtistName:(NSString *)name {
    [self.titleLabel setText:title];
    [self useSimpleDetailFormat];
    [self.subtitleLabel setText:name];
}

-(void) formatCellForAlbumWithTitle:(NSString *)title andArtistName:(NSString *)name {
    [self formatCellForSongWithTitle:title andArtistName:name];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
