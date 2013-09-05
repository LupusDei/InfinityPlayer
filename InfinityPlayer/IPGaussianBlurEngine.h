//
//  IPGaussianBlurEngine.h
//  InfinityPlayer
//
//  Created by Justin Martin on 8/31/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IPGaussianBlurEngine : NSObject

+(UIImage *) blurredImageFromImage:(UIImage *)image withBlurFactor:(float)blurFactor andExplansionFactor:(float)expansionFactor;

@end
