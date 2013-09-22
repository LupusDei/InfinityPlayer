//
//  IPMediaPlayer.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/25/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPMediaPlayer.h"

@implementation IPMediaPlayer {
    int _currentIndex;
}

+(IPMediaPlayer *) mediaPlayer {
    return [[IPMediaPlayer alloc] init];
}

-(instancetype) initWithMusicPlayer:(MPMusicPlayerController *)player {
    self = [super init];
    if (self) {
        self.myPlayer = player;
        self.itemQueue = [NSMutableArray array];
        _currentIndex = 0;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handle_NowPlayingItemChanged:)
                                                     name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification
                                                   object:self.myPlayer];
        [self.myPlayer beginGeneratingPlaybackNotifications];
    }
    return self;
}

-(instancetype) init {
    return [self initWithMusicPlayer:[MPMusicPlayerController iPodMusicPlayer]];
}

#pragma mark PlayState
-(BOOL) isPlaying {
    return self.myPlayer.playbackState == MPMusicPlaybackStatePlaying;
}

-(void) play {
    [self.myPlayer play];
}
-(void) pause {
    [self.myPlayer pause];
}
-(void) stop {
    [self.myPlayer stop];
}

-(void) skipToNextSong {
    _currentIndex ++;
    [self.myPlayer skipToNextItem];
}

-(void) skipToPreviousSong {
    _currentIndex --;
    [self.myPlayer skipToPreviousItem];
}
#pragma mark Getting Content
-(IPPlayable *) getCurrentSong {
    if (_currentIndex < [self.itemQueue count])
        return [self.itemQueue objectAtIndex:_currentIndex];
    else
        return nil;
}

#pragma mark Queue Management
-(void) addItemQueueToPlayerQueue {
    BOOL wasPlaying = [self isPlaying];
    MPMediaItem *currentItem = self.myPlayer.nowPlayingItem;
    NSTimeInterval playbackTime = self.myPlayer.currentPlaybackTime;
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:[self.itemQueue count]];
    [self.itemQueue enumerateObjectsUsingBlock:^(IPPlayable *playable, NSUInteger idx, BOOL *stop) {
        [items addObject:playable.item];
    }];
    [self.myPlayer setQueueWithItemCollection:[MPMediaItemCollection collectionWithItems:items]];
    self.myPlayer.nowPlayingItem = currentItem;
    self.myPlayer.currentPlaybackTime = playbackTime;
    if (wasPlaying)
        [self play];
}

-(void) addSongToQueue:(IPPlayable *)song {
    [self.itemQueue addObject:song];
    [self addItemQueueToPlayerQueue];
}

-(void) addSongsToQueue:(NSArray *)songs {
    [self.itemQueue addObjectsFromArray:songs];
    [self addItemQueueToPlayerQueue];
}

#pragma mark Notification Handlers

-(void) handle_NowPlayingItemChanged:(NSNotification *)note {
    _currentIndex = self.myPlayer.indexOfNowPlayingItem;
}

@end
