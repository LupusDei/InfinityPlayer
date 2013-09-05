//
//  IPGaussianBlurEngine.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/31/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPGaussianBlurEngine.h"
#import <ImageIO/ImageIO.h>
#import <CoreImage/CoreImage.h>

#define AlbumCoverSize 320

@implementation IPGaussianBlurEngine

+(UIImage *) blurredImageFromImage:(UIImage *)image withBlurFactor:(float)blurFactor {
    CIImage *imageToBlur = [CIImage imageWithCGImage:image.CGImage];
    CIFilter *gaussianBlurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [gaussianBlurFilter setValue:imageToBlur forKey:@"inputImage"];
    [gaussianBlurFilter setValue:[NSNumber numberWithFloat:blurFactor] forKey:@"inputRadius"];
    CIImage *resultImage = [gaussianBlurFilter valueForKey:@"outputImage"];
    UIImage *endImage = [[UIImage alloc] initWithCIImage:resultImage];
    return endImage;
}

+(UIImage *) blurredImageFromImage:(UIImage *)image withBlurFactor:(float)blurFactor andExplansionFactor:(float)expansionFactor {
    UIImage *new = [IPGaussianBlurEngine blurredImageFromImage:image withBlurFactor:blurFactor];
    CGSize expanded = CGSizeMake(AlbumCoverSize * expansionFactor, AlbumCoverSize * 1.1 * expansionFactor);
    UIGraphicsBeginImageContext(expanded);
    [new drawInRect:CGRectMake(0, 0, expanded.width, expanded.height)];
    UIImage *expandedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return expandedImage;
}

@end
