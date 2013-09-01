//
//  IPMediaPlayer.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/25/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPMediaPlayer.h"

@implementation IPMediaPlayer

-(id) init {
    self = [super init];
    if (self) {
        self.myPlayer = [MPMusicPlayerController applicationMusicPlayer];
    }
    return self;
}

@end
