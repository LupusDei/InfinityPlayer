//
//  IPSongCVCell.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/18/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPSongCVCell.h"
#import "IPFontHelper.h"
#import "IPBlackOverlayView.h"

@implementation IPSongCVCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.songTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(ipTinySpacer, ipMediumSpacer, ipStandardWidth - ipTinySpacer, ipTitleHeight)];
        [self.songTitleLabel setFont:[IPFontHelper ipTitleFont]];
        [self.songTitleLabel setTextColor:[UIColor whiteColor]];
        [self.songTitleLabel setTextAlignment:NSTextAlignmentCenter];
        
        self.artistLabel = [[UILabel alloc] initWithFrame:CGRectMake(ipTinySpacer, ipMediumSpacer + self.songTitleLabel.height, ipStandardWidth - ipTinySpacer, ipTitleHeight)];
        [self.artistLabel setFont:[IPFontHelper ipSubtitleFont]];
        [self.artistLabel setTextAlignment:NSTextAlignmentCenter];
        [self.artistLabel setTextColor:[UIColor whiteColor]];
        
        self.blurredBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ipStandardWidth, self.height)];
        
        self.albumCoverImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.artistLabel.y + self.artistLabel.height + ipMiniSpacer, ipStandardWidth, ipStandardWidth)];
        

        IPBlackOverlayView *topBlackOverlay = [IPBlackOverlayView overlayWithFrame:CGRectMake(0, 0, self.width, self.height)];
        IPBlackOverlayView *midOverlay = [IPBlackOverlayView overlayWithFrame:CGRectMake(0, self.albumCoverImageView.y + self.albumCoverImageView.height, self.width, ipMiniSpacer)];
        self.progressBar = [IPProgressBarView progressBarAtY:midOverlay.y + midOverlay.height];
        float y = self.progressBar.y + self.progressBar.height;
        IPBlackOverlayView *botOverlay = [IPBlackOverlayView overlayWithFrame:CGRectMake(0,y, self.width, self.height - y)];
        
        [self.contentView addSubview:self.blurredBackgroundImageView];
        [self.contentView addSubview:topBlackOverlay];
        [self.contentView addSubview:midOverlay];
        [self.contentView addSubview:self.progressBar];
        [self.contentView addSubview:botOverlay];
        [self.contentView addSubview:self.albumCoverImageView];
        [self.contentView addSubview:self.songTitleLabel];
        [self.contentView addSubview:self.artistLabel];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
