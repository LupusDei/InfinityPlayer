//
//  IPProgressBarView.h
//  InfinityPlayer
//
//  Created by Justin Martin on 8/30/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IPBlackOverlayView.h"

@interface IPProgressBarView : IPBlackOverlayView

+(IPProgressBarView *)progressBarAtY:(float)y;

-(void) updateDisplayWithProgress:(float) progress;

@end
