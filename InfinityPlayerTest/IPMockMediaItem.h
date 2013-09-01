//
//  IPMockMediaItem.h
//  InfinityPlayer
//
//  Created by Justin Martin on 8/31/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IPMockMediaItem : NSObject

-(id) valueForProperty:(NSString *)propertyName;

@property (nonatomic, strong) NSString  *MPMediaItemPropertyPersistentID;            // filterable
@property (nonatomic, strong) NSString  *MPMediaItemPropertyAlbumPersistentID;       // filterable
@property (nonatomic, strong) NSString  *MPMediaItemPropertyArtistPersistentID;      // filterable
@property (nonatomic, strong) NSString  *MPMediaItemPropertyAlbumArtistPersistentID; // filterable
@property (nonatomic, strong) NSString  *MPMediaItemPropertyGenrePersistentID;       // filterable
@property (nonatomic, strong) NSString  *MPMediaItemPropertyComposerPersistentID;    // filterable
@property (nonatomic, strong) NSString  *MPMediaItemPropertyPodcastPersistentID;     // filterable
@property (nonatomic, strong) NSString  *MPMediaItemPropertyMediaType;               // filterable
@property (nonatomic, strong) NSString  *MPMediaItemPropertyTitle;                   // filterable
@property (nonatomic, strong) NSString  *MPMediaItemPropertyAlbumTitle;              // filterable
@property (nonatomic, strong) NSString  *MPMediaItemPropertyArtist;                  // filterable
@property (nonatomic, strong) NSString  *MPMediaItemPropertyAlbumArtist;             // filterable
@property (nonatomic, strong) NSString  *MPMediaItemPropertyGenre;                   // filterable
@property (nonatomic, strong) NSString  *MPMediaItemPropertyComposer;                // filterable
@property (nonatomic, strong) NSString  *MPMediaItemPropertyPlaybackDuration;
@property (nonatomic, strong) NSString  *MPMediaItemPropertyAlbumTrackNumber;
@property (nonatomic, strong) NSString  *MPMediaItemPropertyAlbumTrackCount;
@property (nonatomic, strong) NSString  *MPMediaItemPropertyDiscNumber;
@property (nonatomic, strong) NSString  *MPMediaItemPropertyDiscCount;
@property (nonatomic, strong) NSString  *MPMediaItemPropertyArtwork;
@property (nonatomic, strong) NSString  *MPMediaItemPropertyLyrics;
@property (nonatomic, strong) NSString  *MPMediaItemPropertyIsCompilation;           // filterable
@property (nonatomic, strong) NSString  *MPMediaItemPropertyReleaseDate;
@property (nonatomic, strong) NSString  *MPMediaItemPropertyBeatsPerMinute;
@property (nonatomic, strong) NSString  *MPMediaItemPropertyComments;
@property (nonatomic, strong) NSString  *MPMediaItemPropertyAssetURL;
@property (nonatomic, strong) NSString  *MPMediaItemPropertyIsCloudItem;
@end
