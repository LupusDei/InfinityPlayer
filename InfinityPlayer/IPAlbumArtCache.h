//
//  IPAlbumArtCache.h
//  InfinityPlayer
//
//  Created by Justin Martin on 8/31/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IPAlbumArtCache : NSObject

+(IPAlbumArtCache *) sharedCache;

-(void) clearCache;

-(UIImage *)imageForAlbumID:(id)key;
-(void) setImage:(UIImage *)image forAlbumID:(id)key;

-(UIImage *)blurredBackgroundImageForAlbumID:(id)key;
-(void) setBlurredBackgroundImage:(UIImage *)image forAlbumID:(id)key;


@end
