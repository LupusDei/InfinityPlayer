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

+(NSString *) getTitleForMediaItem:(MPMediaItem *)item {
    return [item valueForKey:MPMediaItemPropertyAlbumTitle];
}
@end
