//
//  IPPlayableSpec.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/31/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IPPlayable.h"
#import "IPMockHelper.h"
#import "IPAlbumArtCache.h"
#import "IPUIConstants.h"
@interface IPPlayableSpec : XCTestCase {
    IPMockMediaItem *item;
    IPPlayable *playable;
    IPAlbumArtCache *cache;
}

@end

@implementation IPPlayableSpec

- (void)setUp
{
    [super setUp];
    cache = [IPAlbumArtCache sharedCache];
    item = [IPMockHelper itemWithDefaultValues];
    
    playable = [IPPlayable playableWithMediaItem:(MPMediaItem *)item];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
    [cache clearCache];
}

-(void) testItHasTheRightFields {
    XCTAssertEqual(playable.title,item.MPMediaItemPropertyTitle, @"it should ahve the right title");
    XCTAssertEqual(playable.artistName,item.MPMediaItemPropertyArtist, @"it hass the right artist name");
    XCTAssertEqual(playable.albumTitle,item.MPMediaItemPropertyAlbumTitle, @"it has the right album title");
    XCTAssertEqual(playable.albumKey,item.MPMediaItemPropertyAlbumPersistentID, @"it has the right persistent key");
}
-(void) testItHoldsOntoTheMediaItem {
    XCTAssertEqual(playable.item,item, @"it has the media item");
}

-(void) testItUsesTheDefaultImageIfItHasNoArtwork {
    XCTAssertEqual([UIImage imageNamed:ipDefaultAlbumArtworkName],[playable albumArtworkDefaultSize], @"it uses the default image");
}

-(void) testItSetsTheCacheWithTheDefaultImageIfItHasNoArtwork {
    [playable albumArtworkDefaultSize];
    XCTAssertEqual([UIImage imageNamed:ipDefaultAlbumArtworkName],[cache imageForAlbumID:playable.albumKey], @"it stores the iamge in the cache");
}

-(void) testItUsesTheCachedImageIfItExists {
    [cache setImage:@"thing" forAlbumID:playable.albumKey];
    XCTAssertEqual(@"thing",[playable albumArtworkDefaultSize], @"it is the cached thing");
}

-(void) testItUsesTheCachedBlurredImage {
    [cache setBlurredBackgroundImage:@"thing2" forAlbumID:playable.albumKey];
    XCTAssertEqual(@"thing2",[playable blurredAlbumArtworkScaledSize], @"it is the cached thing2");
}
//I don't test the other cases for the blurred image because i don't want to invoke the gaussian engine in the test environment.  They work the same as the default image

-(void) testItUsesTheDefaultImageForTheThumbnail {
    XCTAssertEqual([UIImage imageNamed:ipDefaultAlbumArtworkName],[playable albumArtworkThumbnail], @"it uses the default image");
}
-(void) testItCachesTheThumbnail {
    [playable albumArtworkThumbnail];
    XCTAssertEqual([UIImage imageNamed:ipDefaultAlbumArtworkName],[cache thumbnailForAlbumID:playable.albumKey], @"it stores the iamge in the cache");
}


@end
