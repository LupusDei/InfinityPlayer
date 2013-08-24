//
//  UIImageView+GaussianBlur.h
//  InfinityPlayer
//
//  Created by Justin Martin on 8/18/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <UIKit/UIKit.h>

#define AlbumCoverSize 320

@interface UIImageView (GaussianBlur)

-(void) applyGaussianBlur:(float)blurFactor;
-(void) applyGaussianBlurWithFactor:(float)blurFactor andExpandImageByFactor:(float)factor;
@end
