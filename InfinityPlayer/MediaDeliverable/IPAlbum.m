//
//  IPAlbum.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/7/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPAlbum.h"

@interface IPAlbum()
@property (nonatomic, strong) IPPlayable *repItem;
@end

@implementation IPAlbum
@synthesize songs = _songs;

+(IPAlbum *) albumWithMediaCollection:(MPMediaItemCollection *)itemCol {
    IPAlbum *album = [[IPAlbum alloc] init];
    album.itemCollection = itemCol;
    album.repItem = [IPPlayable playableWithMediaItem:[itemCol representativeItem]];
    return album;
}

-(NSArray *)songs {
    if (!_songs) {
        NSMutableArray *items = [NSMutableArray arrayWithCapacity:self.itemCollection.count];
        [[self.itemCollection items] enumerateObjectsUsingBlock:^(MPMediaItem *item, NSUInteger idx, BOOL *stop) {
            [items addObject:[IPPlayable playableWithMediaItem:item]];
        }];
        _songs = items;
    }
    return _songs;
}

-(NSString *) title {
    return self.repItem.albumTitle;
}

-(NSString *)artistName {
    return self.repItem.artistName;
}
-(NSNumber *)key {
    return self.repItem.albumKey;
}

-(int) songCount {
    return [self.itemCollection count];
}

-(UIImage *)albumArtworkThumbnail {
    return self.repItem.albumArtworkThumbnail;
}

@end
