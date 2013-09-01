//
//  IPPlayableSpec.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/31/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IPPlayable.h"
#import "IPMockMediaItem.h"
@interface IPPlayableSpec : XCTestCase {
    IPMockMediaItem *item;
    IPPlayable *playable;
}

@end

@implementation IPPlayableSpec

- (void)setUp
{
    [super setUp];
    item = [[IPMockMediaItem alloc] init];
    item.MPMediaItemPropertyTitle = @"Cool Title";
    item.MPMediaItemPropertyArtist = @"Great Artist";
    item.MPMediaItemPropertyAlbumTitle  = @"Amazing Album";
    
    playable = [IPPlayable playableWithMediaItem:(MPMediaItem *)item];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

-(void) testItHasTheRightFields {
    XCTAssertEqual(playable.title,item.MPMediaItemPropertyTitle, @"it should ahve the right title");
    XCTAssertEqual(playable.artistName,item.MPMediaItemPropertyArtist, @"it hass the right artist name");
    XCTAssertEqual(playable.albumTitle,item.MPMediaItemPropertyAlbumTitle, @"it has the right album title");
}
-(void) testItHoldsOntoTheMediaItem {
    XCTAssertEqual(playable.item,item, @"it has the media item");
}

@end
