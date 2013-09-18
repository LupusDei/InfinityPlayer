//
//  IPAlbum.h
//  InfinityPlayer
//
//  Created by Justin Martin on 9/7/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPMediaContainer.h"

@interface IPAlbum : IPMediaContainer
+(IPAlbum *) albumWithMediaCollection:(MPMediaItemCollection *)itemCol;

-(NSString *)title;
-(NSString *)artistName;
-(NSNumber *)key;
-(int) songCount;
-(UIImage *)albumArtworkThumbnail;

@end
