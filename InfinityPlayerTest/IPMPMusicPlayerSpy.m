//
//  IPMPMediaPlayerSpy.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/21/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPMPMusicPlayerSpy.h"

@implementation IPMPMusicPlayerSpy
+(IPMPMusicPlayerSpy *) spy {
    return [[IPMPMusicPlayerSpy alloc] init];
}

-(id) init {
    self = [super init];
    self.itemCollection = @[];
    return self;
}

-(void) setQueueWithItemCollection:(NSArray *)array {
    self.itemCollection = array;
}
@end
