//
//  IPMediaInspectorSpecs.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/6/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IPMediaInspector.h"
#import <MediaPlayer/MediaPlayer.h>

#import "IPAlbum.h"
#import "IPArtist.h"
#import "IPMockHelper.h"


@interface IPMediaInspectorSpecs : XCTestCase

@end

@implementation IPMediaInspectorSpecs
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

-(MPMediaPropertyPredicate *) getQueryPredFromPreds:(NSSet *)preds {
    __block MPMediaPropertyPredicate *pred = nil;
    [preds enumerateObjectsUsingBlock:^(MPMediaPropertyPredicate *next, BOOL *stop) {
        if (![next.property isEqualToString:@"mediaType"]) {
            pred = next;
            *stop = YES;
        }
    }];
    return pred;
}

-(void) testItCanGetAllAlbumsWithTitle {
    MPMediaQuery *query = [IPMediaInspector queryForAlbumsWithSearchTitle:@"title1"];
    NSSet *preds = [query filterPredicates];
    MPMediaPropertyPredicate *pred = [self getQueryPredFromPreds:preds];
    XCTAssertEqual(@"title1",pred.value, @"it has the right value");
    XCTAssertEqual(MPMediaItemPropertyAlbumTitle,pred.property, @"it has the right property");
    XCTAssertEqual(MPMediaGroupingAlbum,query.groupingType, @"grouping by album");
    XCTAssertEqual(MPMediaPredicateComparisonContains,pred.comparisonType, @"it finds partial matches");
}

-(void) testItCanGetAllArtistsWithName {
    MPMediaQuery *query = [IPMediaInspector queryForArtistsWithSearchName:@"artist2"];
    NSSet *preds = [query filterPredicates];
    MPMediaPropertyPredicate *pred = [self getQueryPredFromPreds:preds];
    XCTAssertEqual(@"artist2",pred.value, @"it has the right value");
    XCTAssertEqual(MPMediaItemPropertyArtist,pred.property, @"it has the right property");
    XCTAssertEqual(MPMediaGroupingArtist,query.groupingType, @"grouping by artist");
    XCTAssertEqual(MPMediaPredicateComparisonContains,pred.comparisonType, @"it finds partial matches");
}

-(void) testItCanGetAllSongsWithTitle {
    MPMediaQuery *query = [IPMediaInspector queryForSongsWithSearchTitle:@"title3"];
    NSSet *preds = [query filterPredicates];
    MPMediaPropertyPredicate *pred = [self getQueryPredFromPreds:preds];
    XCTAssertEqual(@"title3",pred.value, @"it has the right value");
    XCTAssertEqual(MPMediaItemPropertyTitle,pred.property, @"it has the right property");
    XCTAssertEqual(MPMediaGroupingTitle,query.groupingType, @"grouping by title");
    XCTAssertEqual(MPMediaPredicateComparisonContains,pred.comparisonType, @"it finds partial matches");
}

-(void) testItReturnsAlbumsWhenSearchingForAlbums {
    NSArray *fakeAlbumQueryResponse = @[[IPMockHelper itemCollectionWithSingleItem], [IPMockHelper itemCollectionWithOtherItem]];
    NSArray *albums = [IPMediaInspector albumsFromItemCollections:fakeAlbumQueryResponse];
    
    XCTAssertEqual([IPAlbum class],[[albums objectAtIndex:0] class], @"it is an album");
    XCTAssertEqual([IPAlbum class],[[albums objectAtIndex:1] class], @"it is an album");
}

-(void) testItReturnsPlayablesWhenSearchingForSongs {
    NSArray *fakeSongQueryResponse = @[[IPMockHelper itemWithDefaultValues], [IPMockHelper itemWithOtherValues]];
    NSArray *songs = [IPMediaInspector playablesFromMediaItems:fakeSongQueryResponse];
    
    XCTAssertEqual([IPPlayable class],[[songs objectAtIndex:0] class], @"it is a playable");
    XCTAssertEqual([IPPlayable class],[[songs objectAtIndex:1] class], @"it is a playable");
}
-(void) testItReturnsArtistsWhenSearchingForArtists {
    NSArray *fakeArtistQueryResponse = @[[IPMockHelper itemCollectionWithSingleItem], [IPMockHelper itemCollectionWithOtherItem]];
    NSArray *artists = [IPMediaInspector artistsFromItemCollections:fakeArtistQueryResponse];
    
    XCTAssertEqual([IPArtist class],[[artists objectAtIndex:0] class], @"it is an artist");
    XCTAssertEqual([IPArtist class],[[artists objectAtIndex:1] class], @"it is an artist");
}
@end
