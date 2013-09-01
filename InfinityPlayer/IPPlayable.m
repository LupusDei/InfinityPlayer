//
//  IPPlayable.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/31/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPPlayable.h"

@implementation IPPlayable
+(IPPlayable *) playableWithMediaItem:(MPMediaItem *)item {
    IPPlayable *p = [[IPPlayable alloc] init];
    p.item = item;
    p.artistName = [item valueForProperty:MPMediaItemPropertyArtist];
    p.title = [item valueForProperty:MPMediaItemPropertyTitle];
    p.albumTitle = [item valueForProperty:MPMediaItemPropertyAlbumTitle];
    return p;
}

-(id) init {
    self = [super init];
    return self;
}

-(UIImage *) albumArtworkDefaultSize {
    MPMediaItemArtwork *art = [self.item valueForProperty:MPMediaItemPropertyArtwork];
    return [art imageWithSize:CGSizeMake(320, 320)];
}

@end
