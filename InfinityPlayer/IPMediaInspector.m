//
//  IPMediaInspector.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/18/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPMediaInspector.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation IPMediaInspector

+(NSArray *)getAllMedia {
    MPMediaQuery *query = [[MPMediaQuery alloc] init];
    return [query collections];
}

@end
