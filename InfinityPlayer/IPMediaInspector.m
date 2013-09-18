//
//  IPMediaInspector.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/18/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPMediaInspector.h"

@implementation IPMediaInspector

#pragma mark Albums
+(MPMediaQuery *) queryForAlbumsWithSearchTitle:(NSString *)title {
    MPMediaQuery *query = [MPMediaQuery albumsQuery];
    MPMediaPredicate *pred = [MPMediaPropertyPredicate predicateWithValue:title forProperty:MPMediaItemPropertyAlbumTitle comparisonType:MPMediaPredicateComparisonContains];
    [query addFilterPredicate:pred];
    return query;
}
+(NSArray *) albumsFromItemCollections:(NSArray *)itemCollections {
    NSMutableArray *albums = [NSMutableArray arrayWithCapacity:[itemCollections count]];
    [itemCollections enumerateObjectsUsingBlock:^(MPMediaItemCollection *itemCol, NSUInteger idx, BOOL *stop) {
        [albums addObject:[IPAlbum albumWithMediaCollection:itemCol]];
    }];
    return albums;
}
+(NSArray *) getAllAlbumsWithSearchTitle:(NSString *)title {
    return [IPMediaInspector albumsFromItemCollections:[[IPMediaInspector queryForAlbumsWithSearchTitle:title] collections]];
}

#pragma mark Artists
+(MPMediaQuery *) queryForArtistsWithSearchName:(NSString *)name {
    MPMediaQuery *query = [MPMediaQuery artistsQuery];
    MPMediaPredicate *pred = [MPMediaPropertyPredicate predicateWithValue:name forProperty:MPMediaItemPropertyArtist comparisonType:MPMediaPredicateComparisonContains];
    [query addFilterPredicate:pred];
    return query;
}

+(NSArray *)artistsFromItemCollections:(NSArray *)itemCols {
    NSMutableArray *artists = [NSMutableArray arrayWithCapacity:[itemCols count]];
    [itemCols enumerateObjectsUsingBlock:^(MPMediaItemCollection *itemCol, NSUInteger idx, BOOL *stop) {
        [artists addObject:[IPArtist artistWithMediaCollection:itemCol]];
    }];
    return artists;
}

+(NSArray *) getAllArtistsWithSearchName:(NSString *)name {
    return [IPMediaInspector artistsFromItemCollections:[[IPMediaInspector queryForArtistsWithSearchName:name] collections]];
}

#pragma mark Songs
+(MPMediaQuery *) queryForSongsWithSearchTitle:(NSString *)title {
    MPMediaQuery *query = [MPMediaQuery songsQuery];
    MPMediaPredicate *pred = [MPMediaPropertyPredicate predicateWithValue:title forProperty:MPMediaItemPropertyTitle comparisonType:MPMediaPredicateComparisonContains];
    [query addFilterPredicate:pred];
    return query;
}
+(NSArray *) playablesFromMediaItems:(NSArray *)items {
    NSMutableArray *playables = [NSMutableArray arrayWithCapacity:[items count]];
    [items enumerateObjectsUsingBlock:^(MPMediaItem *item, NSUInteger idx, BOOL *stop) {
        [playables addObject:[IPPlayable playableWithMediaItem:item]];
    }];
    return playables;
}
+(NSArray *) getAllSongsWithSearchTitle:(NSString *)title {
    return [IPMediaInspector playablesFromMediaItems:[[IPMediaInspector queryForSongsWithSearchTitle:title] items]];
}
@end
