//
//  IPMediaInspector.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/18/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPMediaInspector.h"

@implementation IPMediaInspector

+(NSArray *)getAllMedia {
    MPMediaQuery *query = [[MPMediaQuery alloc] init];
    return [query collections];
}

+(NSArray *) getAllMediaGroupedByAlbum {
    MPMediaQuery *query = [MPMediaQuery albumsQuery];
    return [query collections];
}

+(MPMediaQuery *) queryForAlbumsWithSearchTitle:(NSString *)title {
    MPMediaQuery *query = [MPMediaQuery albumsQuery];
    MPMediaPredicate *pred = [MPMediaPropertyPredicate predicateWithValue:title forProperty:MPMediaItemPropertyAlbumTitle comparisonType:MPMediaPredicateComparisonContains];
    [query addFilterPredicate:pred];
    return query;
}
+(NSArray *) getAllAlbumsWithSearchTitle:(NSString *)title {
    return [[IPMediaInspector queryForAlbumsWithSearchTitle:title] collections];
}

+(MPMediaQuery *) queryForArtistsWithSearchName:(NSString *)name {
    MPMediaQuery *query = [MPMediaQuery artistsQuery];
    MPMediaPredicate *pred = [MPMediaPropertyPredicate predicateWithValue:name forProperty:MPMediaItemPropertyArtist comparisonType:MPMediaPredicateComparisonContains];
    [query addFilterPredicate:pred];
    return query;
}
+(NSArray *) getAllArtistsWithSearchName:(NSString *)name {
    return [[IPMediaInspector queryForArtistsWithSearchName:name] collections];
}

+(MPMediaQuery *) queryForSongsWithSearchTitle:(NSString *)title {
    MPMediaQuery *query = [MPMediaQuery songsQuery];
    MPMediaPredicate *pred = [MPMediaPropertyPredicate predicateWithValue:title forProperty:MPMediaItemPropertyTitle comparisonType:MPMediaPredicateComparisonContains];
    [query addFilterPredicate:pred];
    return query;
}
+(NSArray *) getAllSongsWithSearchTitle:(NSString *)title {
    return [[IPMediaInspector queryForSongsWithSearchTitle:title] collections];
}
@end
