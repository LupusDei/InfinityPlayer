//
//  IPMockMediaItem.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/31/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPMockMediaItem.h"
#import <MediaPlayer/MediaPlayer.h>
@implementation IPMockMediaItem

-(id) valueForProperty:(NSString *)propertyName {
    if ([propertyName isEqualToString:MPMediaItemPropertyArtist]) {
        return self.MPMediaItemPropertyArtist;
    }
    else if ([propertyName isEqualToString:MPMediaItemPropertyTitle]) {
        return self.MPMediaItemPropertyTitle;
    }
    else if ([propertyName isEqualToString:MPMediaItemPropertyAlbumTitle]) {
        return self.MPMediaItemPropertyAlbumTitle;
    }
    else if ([propertyName isEqualToString:MPMediaItemPropertyAlbumPersistentID]) {
        return self.MPMediaItemPropertyAlbumPersistentID;
    }
    else if ([propertyName isEqualToString:MPMediaItemPropertyArtwork]) {
        return self;
    }
    else {return @"";}
}

-(id) imageWithSize:(CGSize)size {
    if (self.MPMediaItemPropertyArtwork) {
        return self.MPMediaItemPropertyArtwork;
    }
    return nil;
}

@end
