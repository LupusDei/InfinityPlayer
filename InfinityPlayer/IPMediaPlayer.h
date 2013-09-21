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
@property int currentIndex;
@property (nonatomic, strong) MPMusicPlayerController *myPlayer;

+(IPMediaPlayer *) mediaPlayer;

-(void) addSongToQueue:(IPPlayable *)song;

@end
