//
//  IPArtistSpec.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/17/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "IPArtist.h"

#import "IPUIConstants.h"
#import "IPMockHelper.h"


@interface IPArtistSpec : XCTestCase

@end

@implementation IPArtistSpec {
    IPArtist *artist;
    IPMockMediaItemCollection *itemCol;
}

- (void)setUp
{
    itemCol = [IPMockHelper itemCollectionWithSingleItem];
    artist = [IPArtist artistWithMediaCollection:(MPMediaItemCollection *)itemCol];
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

-(void) testAnArtistHasTheRightFields {
    XCTAssertNotNil(artist, @"it should not be nil");
    XCTAssertEqual(itemCol,artist.itemCollection, @"it has the item collection");
    XCTAssertEqual(ipMockDefaultArtistName,artist.name, @"it has the artist name");
}

-(void) testItReturnsTheSongsAsPlayables {
    XCTAssertEqual([IPPlayable class],[[artist.songs lastObject] class], @"it returns playables");
}
@end
