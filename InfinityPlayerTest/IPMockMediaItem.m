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
    else {return @"";}
}

@end
