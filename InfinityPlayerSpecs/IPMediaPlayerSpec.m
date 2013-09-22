//
//  IPMediaPlayerSpec.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/21/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

@import XCTest;
#import "IPMediaPlayer.h"
#import "IPMPMusicPlayerSpy.h"
#import "IPMockHelper.h"
#import "IPPlayable.h"

@interface IPMediaPlayerSpec : XCTestCase

@end

@implementation IPMediaPlayerSpec {
    IPMediaPlayer *_player;
    IPMPMusicPlayerSpy *_mpMusicPlayer;
    IPMockMediaItem *_item1;
    IPMockMediaItem *_item2;
    IPPlayable *_song1;
    IPPlayable *_song2;
}

- (void)setUp
{
    [super setUp];
    _mpMusicPlayer = [IPMPMusicPlayerSpy spy];
    _player = [[IPMediaPlayer alloc] initWithMusicPlayer:(MPMusicPlayerController *)_mpMusicPlayer];
    
    _item1 = [IPMockHelper itemWithDefaultValues];
    _song1 = [IPPlayable playableWithMediaItem:(MPMediaItem *)_item1];
    _item2 = [IPMockHelper itemWithOtherValues];
    _song2 = [IPPlayable playableWithMediaItem:(MPMediaItem *)_item2];
    
    [_player addSongToQueue:_song1];
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
    XCTAssertNil([player getCurrentSong], @"its current song is initially nil");
}

-(void) testItCanAddAnItemToTheQueue {
    [_player addSongToQueue:_song2];
    XCTAssertEqual(_song2,[_player.itemQueue lastObject], @"it has the correct song");
    XCTAssertEqual(_item2,[[_mpMusicPlayer itemCollection] lastObject], @"it adds the mediaItem to the real music queue");
}

-(void) testItCanAddSeveralItemsToTheQueue {
    [_player addSongsToQueue:@[_song2, _song1]];
    XCTAssertEqual(_song1,[_player.itemQueue lastObject], @"it has the correct last song");
    XCTAssertEqual(_item1,[[_mpMusicPlayer itemCollection] lastObject], @"it adds the mediaItem to the real music queue");
    XCTAssertTrue(3 == [_player.itemQueue count], @"it added both the items");
}

-(void) testAddingNewSongsDoesNotChangeThePlayState {
    [_player addSongToQueue:_song2];
    [_player play];
    [_player skipToNextSong];
    _mpMusicPlayer.currentPlaybackTime = NSTimeIntervalSince1970;
    
    XCTAssertEqual(_song2,[_player getCurrentSong], @"it has the right song");
    XCTAssertEqual(_item2,_mpMusicPlayer.nowPlayingItem, @"it has the right index");
    XCTAssertEqual(NSTimeIntervalSince1970,_mpMusicPlayer.currentPlaybackTime, @"it has the right playback time");
    XCTAssertTrue(_player.isPlaying, @"it is playing the song");
    
    IPPlayable *song3 = [IPPlayable playableWithMediaItem:(MPMediaItem *)_item1];
    [_player addSongToQueue:song3];
    
    XCTAssertEqual(_song2,[_player getCurrentSong], @"it has the right song");
    XCTAssertEqual(_item2,_mpMusicPlayer.nowPlayingItem, @"it has the right index");
        XCTAssertEqual(NSTimeIntervalSince1970,_mpMusicPlayer.currentPlaybackTime, @"it has the right playback time");
    XCTAssertTrue(_player.isPlaying, @"it is still playing the song");
}

-(void) testItCanGetTheCurrentPlayable {
    XCTAssertEqual(_song1,[_player getCurrentSong], @"it has the current song");
}

- (void) testItCanPlayAnItem {
    XCTAssertFalse([_player isPlaying], @"it is not playing until told to");

    [_player play];
    
    XCTAssertTrue([_player isPlaying], @"it is playing");
    XCTAssertTrue(_mpMusicPlayer.playbackState == MPMusicPlaybackStatePlaying, @"play was called on the music player");
}

- (void) testItCanPause {
    [_player play];
    [_player pause];
    
    XCTAssertFalse([_player isPlaying], @"it is not playing while paused");
    XCTAssertTrue(_mpMusicPlayer.playbackState == MPMusicPlaybackStatePaused, @"play was called on the music player");
}

- (void) testItCanStop {
    [_player play];
    [_player stop];
    
    XCTAssertFalse([_player isPlaying], @"it is not playing");
    XCTAssertTrue(_mpMusicPlayer.playbackState == MPMusicPlaybackStateStopped, @"play was called on the music player");
}

- (void) testCanSkipToTheNextItem {
    [_player addSongToQueue:_song2];
    [_player skipToNextSong];
    
    XCTAssertEqual(_song2,[_player getCurrentSong], @"it skipped to the next song");
    XCTAssertEqual(1,_mpMusicPlayer.indexOfNowPlayingItem, @"it told the music player to skip");
}

- (void) testCanSkipToThePreviousItem {
    [_player addSongToQueue:_song2];
    [_player skipToNextSong];
    [_player skipToPreviousSong];
    
    XCTAssertEqual(_song1,[_player getCurrentSong], @"it skipped to the next song");
    XCTAssertEqual(0,_mpMusicPlayer.indexOfNowPlayingItem, @"it told the music player to skip");
}

- (void) testTheMediaPlayerChangesTheSongWhenTheMusicPlayerDoes {
    [_player addSongToQueue:_song2];
    XCTAssertEqual(0,_mpMusicPlayer.indexOfNowPlayingItem, @"it is playing at the first index");
    XCTAssertEqual(_song1,[_player getCurrentSong], @"it is playing the first song");
    
    [_mpMusicPlayer skipToNextItem];
    
    XCTAssertEqual(1,_mpMusicPlayer.indexOfNowPlayingItem, @"it is playing at the next index");
    XCTAssertEqual(_song2,[_player getCurrentSong], @"it is playing the next song");
}
@end
