//
//  IPMediaInspector.h
//  InfinityPlayer
//
//  Created by Justin Martin on 8/18/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface IPMediaInspector : NSObject

+(NSArray *) getAllMedia;
+(NSArray *) getAllMediaGroupedByAlbum;
+(MPMediaQuery *) queryForAlbumsWithSearchTitle:(NSString *)title;
+(NSArray *) getAllAlbumsWithSearchTitle:(NSString *)title;

+(MPMediaQuery *) queryForArtistsWithSearchName:(NSString *)name;
+(NSArray *) getAllArtistsWithSearchName:(NSString *)name;

+(MPMediaQuery *) queryForSongsWithSearchTitle:(NSString *)title;
+(NSArray *) getAllSongsWithSearchTitle:(NSString *)title;
@end
