//
//  IPPlayable.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/31/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPPlayable.h"
#import "IPAlbumArtCache.h"
#import "IPGaussianBlurEngine.h"

@implementation IPPlayable
+(IPPlayable *) playableWithMediaItem:(MPMediaItem *)item {
    IPPlayable *p = [[IPPlayable alloc] init];
    p.item = item;
    p.artistName = [item valueForProperty:MPMediaItemPropertyArtist];
    p.title = [item valueForProperty:MPMediaItemPropertyTitle];
    p.albumTitle = [item valueForProperty:MPMediaItemPropertyAlbumTitle];
    p.albumKey = [item valueForProperty:MPMediaItemPropertyAlbumPersistentID];
    return p;
}

-(id) init {
    self = [super init];
    return self;
}

-(UIImage *) albumArtworkThumbnail {
    MPMediaItemArtwork *art = [self.item valueForProperty:MPMediaItemPropertyArtwork];
    UIImage *image = [art imageWithSize:CGSizeMake(ipCellAlbumArtSize, ipCellAlbumArtSize)];
    if (!image) {
        image = [UIImage imageNamed:ipDefaultAlbumArtworkName];
    }
    return image;
}

-(UIImage *) albumArtworkDefaultSize {
    UIImage *image = [[IPAlbumArtCache sharedCache] imageForAlbumID:self.albumKey];
    if (!image) {
        MPMediaItemArtwork *art = [self.item valueForProperty:MPMediaItemPropertyArtwork];
        image = [art imageWithSize:CGSizeMake(320, 320)];
        if (!image) {
            image = [UIImage imageNamed:ipDefaultAlbumArtworkName];
        }
        [[IPAlbumArtCache sharedCache] setImage:image forAlbumID:self.albumKey];
    }
    return image;
}

-(UIImage *) blurredAlbumArtworkScaledSize {
    UIImage *image = [[IPAlbumArtCache sharedCache] blurredBackgroundImageForAlbumID:self.albumKey];
    if (!image) {
        UIImage *norm = [self albumArtworkDefaultSize];
        image = [IPGaussianBlurEngine blurredImageFromImage:norm withBlurFactor:ipMediumGaussianBlur andExplansionFactor:2.2];
        [[IPAlbumArtCache sharedCache] setBlurredBackgroundImage:image forAlbumID:self.albumKey];
    }
    return image;
}

@end
