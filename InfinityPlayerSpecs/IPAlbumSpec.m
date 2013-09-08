//
//  IPAlbumSpec.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/7/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IPAlbum.h"
#import "IPUIConstants.h"
#import "IPMockHelper.h"
#import "IPMockMediaItemCollection.h"

@interface IPAlbumSpec : XCTestCase

@end

@implementation IPAlbumSpec {
    IPAlbum *album;
    IPMockMediaItemCollection *itemCol;
}

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    itemCol = [IPMockHelper itemCollectionWithSingleItem];
    album = [IPAlbum albumWithMediaCollection:(MPMediaItemCollection *)itemCol];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

-(void) testAnAlbumHasTheRightFields {
    XCTAssertNotNil(album, @"it shouldn't be nil");
    XCTAssertEqual(itemCol,album.itemCollection, @"it has the orignalCollection");
    XCTAssertEqual(ipMockDefaultAlbumTitle,album.title, @"it gets the title from the collection");
    XCTAssertEqual(ipMockDefaultArtistName,album.artistName, @"it gets the artist name from the colelction");
    XCTAssertEqual(ipMockDefaultAlbumKey,album.key, @"it get the key from the col");
    XCTAssertEqual(1,album.songCount, @"it has the correct number of tracks");
}

-(void) testItReturnsTheSongsAsPlayables {
    XCTAssertEqual([IPPlayable class],[[[album songs] lastObject] class], @"it returns Playables for songs");
    XCTAssertEqual(ipMockDefaultSongTitle,[[[album songs] lastObject] title], @"with the correct fields");
}

-(void) testItUsesTheDefaultArtworkWhenThereIsNoOther {
    XCTAssertEqual([UIImage imageNamed:ipDefaultAlbumArtworkName],[album albumArtworkThumbnail], @"it uses the default image");
}

@end
