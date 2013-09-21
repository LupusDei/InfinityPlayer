//
//  IPMediaPlayerSpec.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/21/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IPMediaPlayer.h"
#import "IPMPMusicPlayerSpy.h"
#import "IPMockHelper.h"
#import "IPPlayable.h"

@interface IPMediaPlayerSpec : XCTestCase

@end

@implementation IPMediaPlayerSpec {
    IPMediaPlayer *_player;
    IPMPMusicPlayerSpy *_mpMusicPlayer;
}

- (void)setUp
{
    [super setUp];
    _player = [IPMediaPlayer mediaPlayer];
    _mpMusicPlayer = [IPMPMusicPlayerSpy spy];
    _player.myPlayer = (MPMusicPlayerController *)_mpMusicPlayer;
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void) testItHasAMusicPlayer {
    IPMediaPlayer *player = [IPMediaPlayer mediaPlayer];
    XCTAssertNotNil(player, @"it is created");
    XCTAssertNotNil(player.myPlayer, @"it has a player");
}

-(void) testItCanAddItemsToTheQueue {
    IPMockMediaItem *item = [IPMockHelper itemWithDefaultValues];
    IPPlayable *song = [IPPlayable playableWithMediaItem:(MPMediaItem *)item];
    [_player addSongToQueue:song];
    
    XCTAssertEqual(song,[_player.itemQueue lastObject], @"it has the correct song");
    XCTAssertEqual(song.item,[[_mpMusicPlayer itemCollection] lastObject], @"it adds the mediaItem to the real music queue");
}
@end
