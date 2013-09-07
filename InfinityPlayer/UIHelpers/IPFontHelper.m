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
    return [UIFont fontWithName:@"HelveticaNeue-Light" size: ipTitleFontHeight];
}
+(UIFont *) ipSubtitleFont {
    return [UIFont fontWithName:@"HelveticaNeue-UltraLight" size: ipTitleFontHeight];
}

+(UIFont *) ipCellTitleFont {
    return [UIFont fontWithName:@"HelveticaNeue-Light" size: ipCellTitleFontHeight];
}

+(UIFont *) ipCellSubtitleFont {
    return [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:ipCellSubtitleFontHeight];
}
@end
