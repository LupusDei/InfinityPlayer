//
//  IPMPMediaPlayerSpy.h
//  InfinityPlayer
//
//  Created by Justin Martin on 9/21/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface IPMPMusicPlayerSpy : NSObject
@property (nonatomic, strong) NSArray *itemCollection;
@property MPMusicPlaybackState playbackState;
@property int indexOfNowPlayingItem;
@property (nonatomic, strong) MPMediaItem *nowPlayingItem;

@property NSTimeInterval currentPlaybackTime;

+(instancetype) spy;

-(void) play;
-(void) pause;
-(void) stop;

-(void) skipToNextItem;
-(void) skipToPreviousItem;

-(void) setQueueWithItemCollection:(MPMediaItemCollection *)col;

-(void) beginGeneratingPlaybackNotifications;

@end
