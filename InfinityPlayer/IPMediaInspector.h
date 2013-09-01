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

+(NSString *) getTitleForMediaItem:(MPMediaItem *)item;

@end
