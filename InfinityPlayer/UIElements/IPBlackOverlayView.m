//
//  IPBlackOverlayView.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/31/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPBlackOverlayView.h"

@implementation IPBlackOverlayView
+(IPBlackOverlayView *) overlayWithFrame:(CGRect)frame {
    return [[IPBlackOverlayView alloc] initWithFrame:frame];
}

-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.alpha = ipBlackOverlayAlpha;
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}
@end
