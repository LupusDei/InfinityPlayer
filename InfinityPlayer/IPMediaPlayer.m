//
//  IPMediaPlayer.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/25/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPMediaPlayer.h"

@implementation IPMediaPlayer

+(IPMediaPlayer *) mediaPlayer {
    return [[IPMediaPlayer alloc] init];
}

-(id) init {
    self = [super init];
    if (self) {
        self.myPlayer = [MPMusicPlayerController iPodMusicPlayer];
        self.itemQueue = [NSMutableArray array];
    }
    return self;
}

-(void) addSongToQueue:(IPPlayable *)song {
    [self.itemQueue addObject:song];
    [self.myPlayer setQueueWithItemCollection:<#(MPMediaItemCollection *)#>]
}

@end
