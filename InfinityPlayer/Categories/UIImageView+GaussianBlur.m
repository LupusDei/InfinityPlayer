//
//  UIImageView+GaussianBlur.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/18/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "UIImageView+GaussianBlur.h"
#import <ImageIO/ImageIO.h>
#import <CoreImage/CoreImage.h>

@implementation UIImageView (GaussianBlur)

-(void) applyGaussianBlur:(float)blurFactor {
    CIImage *imageToBlur = [CIImage imageWithCGImage:self.image.CGImage];
    CIFilter *gaussianBlurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [gaussianBlurFilter setValue:imageToBlur forKey:@"inputImage"];
    [gaussianBlurFilter setValue:[NSNumber numberWithFloat:blurFactor] forKey:@"inputRadius"];
    CIImage *resultImage = [gaussianBlurFilter valueForKey:@"outputImage"];
    UIImage *endImage = [[UIImage alloc] initWithCIImage:resultImage];
    
    self.image = endImage;
}

-(void) applyGaussianBlurWithFactor:(float)blurFactor andExpandImageByFactor:(float)factor {
    [self applyGaussianBlur:blurFactor];
    CGSize expanded = CGSizeMake(AlbumCoverSize * factor, AlbumCoverSize * factor);
    UIGraphicsBeginImageContext(expanded);
    [self.image drawInRect:CGRectMake(0, 0, expanded.width, expanded.height)];
    UIImage *expandedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self setContentMode:UIViewContentModeCenter];
    [self setImage:expandedImage];
}

@end
