//
//  IPMockHelper.h
//  InfinityPlayer
//
//  Created by Justin Martin on 9/7/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPMockMediaItem.h"
#import "IPMockMediaItemCollection.h"

#define ipMockDefaultSongTitle @"Paranoid Android"
#define ipMockDefaultAlbumTitle @"OK Computer"
#define ipMockDefaultArtistName @"Radiohead"
#define ipMockDefaultAlbumKey @"Album Key"

#define ipMockSecondSongTitle @"Driving to Heaven"
#define ipMockSecondAlbumTitle @"Elements of Life"
#define ipMockSecondArtistName @"Tiesto"
#define ipMockSecondAlbumKey @"Album Key 2"


@interface IPMockHelper : NSObject

+(IPMockMediaItem *) itemWithDefaultValues;
+(IPMockMediaItem *) itemWithDefaultValuesAndSongTitle:(NSString *)title;
+(IPMockMediaItem *) itemWithOtherValues;
+(IPMockMediaItemCollection *) itemCollectionWithOtherItem;
+(IPMockMediaItemCollection *) itemCollectionWithSingleItem;

@end
