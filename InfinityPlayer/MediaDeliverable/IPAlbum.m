//
//  IPAlbum.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/7/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPAlbum.h"

@implementation IPAlbum

+(IPAlbum *) albumWithMediaCollection:(MPMediaItemCollection *)itemCol {
    IPAlbum *album = [[IPAlbum alloc] initWithItemCollection:itemCol];
    return album;
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
