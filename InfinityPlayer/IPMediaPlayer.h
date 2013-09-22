//
//  IPMediaPlayer.h
//  InfinityPlayer
//
//  Created by Justin Martin on 8/25/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "IPPlayable.h"
@interface IPMediaPlayer : NSObject
@property NSMutableArray *itemQueue;

@property (nonatomic, strong) MPMusicPlayerController *myPlayer;

+(IPMediaPlayer *) mediaPlayer;
-(instancetype) initWithMusicPlayer:(MPMusicPlayerController *)player;

-(BOOL) isPlaying;

-(void) play;
-(void) pause;
-(void) stop;
-(void) skipToNextSong;
-(void) skipToPreviousSong;

-(IPPlayable *) getCurrentSong;

-(void) addSongToQueue:(IPPlayable *)song;
-(void) addSongsToQueue:(NSArray *)songs;

@end
