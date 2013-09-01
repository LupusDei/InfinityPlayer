//
//  IPProgressBarView.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/30/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPProgressBarView.h"
#import "IPUIConstants.h"
#import "UIView+SizeHelper.h"

@implementation IPProgressBarView {
    float _progress;
}
+(IPProgressBarView *) progressBarAtY:(float)y {
    return [[IPProgressBarView alloc] initWithFrame:CGRectMake(0, y, ipStandardWidth, ipTinySpacer)];
}

-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _progress = 0;
    }
    return self;
}

-(void) updateDisplayWithProgress:(float)progress {
    _progress = progress;
    
    [self withX:self.width * progress];
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
