//
//  IPAlbumArtCache.m
//  InfinityPlayer
//
//  Created by Justin Martin on 8/31/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPAlbumArtCache.h"

@interface IPAlbumArtCache()
@property (nonatomic, strong) NSMutableDictionary *thumbnailCache;
@property (nonatomic, strong) NSMutableDictionary *imageCache;
@property (nonatomic, strong) NSMutableDictionary *backgroundImageCache;
@end

@implementation IPAlbumArtCache {
}

static IPAlbumArtCache *currentCache = nil;

+(IPAlbumArtCache *) sharedCache {
    @synchronized(self) {
        if (currentCache == nil) {
            currentCache = [[self alloc] init];
            currentCache.thumbnailCache = [NSMutableDictionary dictionary];
            currentCache.imageCache = [NSMutableDictionary dictionary];
            currentCache.backgroundImageCache = [NSMutableDictionary dictionary];
        }
    }
    return currentCache;
}

+(id) allocWithZone:(struct _NSZone *)zone {
    @synchronized(self) {
        if (currentCache == nil) {
            currentCache = [super allocWithZone:zone];
        }
        return currentCache;
    }
    return nil;
}

-(void) clearCache {
    currentCache.imageCache = [NSMutableDictionary dictionary];
    currentCache.backgroundImageCache = [NSMutableDictionary dictionary];
}

-(UIImage *)thumbnailForAlbumID:(id)key {
    return [self.thumbnailCache objectForKey:key];
}
-(void) setThumbnail:(UIImage *)image forAlbumID:(id)key {
    [self.thumbnailCache setObject:image forKey:key];
}

-(UIImage *)imageForAlbumID:(id)key {
    return [self.imageCache objectForKey:key];
}
-(void) setImage:(UIImage *)image forAlbumID:(id)key {
    [self.imageCache setObject:image forKey:key];
}

-(UIImage *)blurredBackgroundImageForAlbumID:(id)key {
    return [self.backgroundImageCache objectForKey:key];
}
-(void) setBlurredBackgroundImage:(UIImage *)image forAlbumID:(id)key {
    [self.backgroundImageCache setObject:image forKey:key];
}

@end
