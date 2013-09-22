//
//  IPMPMediaPlayerSpy.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/21/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPMPMusicPlayerSpy.h"
@implementation IPMPMusicPlayerSpy {
    BOOL _isGeneratingNotes;
}
+(instancetype) spy {
    return [[IPMPMusicPlayerSpy alloc] init];
}

-(instancetype) init {
    self = [super init];
    self.itemCollection = @[];
    self.indexOfNowPlayingItem = 0;
    self.playbackState = MPMusicPlaybackStateStopped;
    _isGeneratingNotes = NO;
    return self;
}

-(void) setQueueWithItemCollection:(MPMediaItemCollection *)col {
    self.indexOfNowPlayingItem = 0;
    self.currentPlaybackTime = 0;
    self.itemCollection = [col items];
    self.nowPlayingItem = self.itemCollection[0];
    self.playbackState = MPMusicPlaybackStateStopped;
}

-(void) play {
    self.playbackState = MPMusicPlaybackStatePlaying;
    if (!self.nowPlayingItem && [self.itemCollection count] > 0) {
        self.nowPlayingItem = self.itemCollection[0];
    }
}
-(void) pause {
    self.playbackState = MPMusicPlaybackStatePaused;
}
-(void) stop {
    self.playbackState = MPMusicPlaybackStateStopped;
}

-(void) skipToNextItem {
    self.indexOfNowPlayingItem += 1;
    self.nowPlayingItem = self.itemCollection[self.indexOfNowPlayingItem];
    if (_isGeneratingNotes) {
        [[NSNotificationCenter defaultCenter] postNotificationName:MPMusicPlayerControllerNowPlayingItemDidChangeNotification object:self];
    }
}
-(void) skipToPreviousItem {
    self.indexOfNowPlayingItem -=1;
    self.nowPlayingItem = self.itemCollection[self.indexOfNowPlayingItem];
    if (_isGeneratingNotes) {
        [[NSNotificationCenter defaultCenter] postNotificationName:MPMusicPlayerControllerNowPlayingItemDidChangeNotification object:self];
    }
}

-(void) beginGeneratingPlaybackNotifications {
    _isGeneratingNotes = YES;
}
@end
