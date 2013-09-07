//
//  IPAlbumSpec.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/7/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface IPAlbumSpec : XCTestCase

@end

@implementation IPAlbumSpec {
    IPAlbum *album;
}

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

-(void) testAnAlbumHasTheRightFields {
    album = [IPAlbum albumWithMediaCollection:nil];
    XCTAssertNotNil(album, @"it shouldn't be nil");
}

@end
