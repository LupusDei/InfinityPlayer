//
//  IPPlayable.h
//  InfinityPlayer
//
//  Created by Justin Martin on 8/31/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface IPPlayable : NSObject
@property (nonatomic, strong) MPMediaItem *item;

@property (nonatomic, strong) NSNumber *albumKey;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *artistName;
@property (nonatomic, strong) NSString *albumTitle;


+(IPPlayable *) playableWithMediaItem:(MPMediaItem *)item;

-(UIImage *) albumArtworkDefaultSize;
-(UIImage *) blurredAlbumArtworkScaledSize;
@end
