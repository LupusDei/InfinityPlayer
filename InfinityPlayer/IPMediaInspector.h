//
//  IPMediaInspector.h
//  InfinityPlayer
//
//  Created by Justin Martin on 8/18/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "IPAlbum.h"
#import "IPArtist.h"
#import "IPPlayable.h"

@interface IPMediaInspector : NSObject

+(MPMediaQuery *) queryForAlbumsWithSearchTitle:(NSString *)title;
+(NSArray *) albumsFromItemCollections:(NSArray *)itemCols;
+(NSArray *) getAllAlbumsWithSearchTitle:(NSString *)title;

+(MPMediaQuery *) queryForArtistsWithSearchName:(NSString *)name;
+(NSArray *) artistsFromItemCollections:(NSArray *)itemCols;
+(NSArray *) getAllArtistsWithSearchName:(NSString *)name;

+(MPMediaQuery *) queryForSongsWithSearchTitle:(NSString *)title;
+(NSArray *) playablesFromMediaItems:(NSArray *)items;
+(NSArray *) getAllSongsWithSearchTitle:(NSString *)title;
@end
