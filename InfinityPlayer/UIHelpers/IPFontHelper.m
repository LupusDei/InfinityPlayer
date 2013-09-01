//
//  IPFontHelper.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/31/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPFontHelper.h"
#import "IPUIConstants.h"

@implementation IPFontHelper
+(UIFont *) ipTitleFont {
    return [UIFont fontWithName:@"HelveticaNeue-Light" size: ipTitleHeight - 2];
}
+(UIFont *) ipSubtitleFont {
    return [UIFont fontWithName:@"HelveticaNeue-UltraLight" size: ipTitleHeight - 2];
}
@end
