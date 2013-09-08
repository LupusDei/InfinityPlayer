//
//  IPMockHelper.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/7/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPMockHelper.h"

@implementation IPMockHelper

+(IPMockMediaItem *) itemWithDefaultValues {
    IPMockMediaItem *item1 = [[IPMockMediaItem alloc] init];
    item1.MPMediaItemPropertyTitle = ipMockDefaultSongTitle;
    item1.MPMediaItemPropertyArtist = ipMockDefaultArtistName;
    item1.MPMediaItemPropertyAlbumTitle  = ipMockDefaultAlbumTitle;
    item1.MPMediaItemPropertyAlbumPersistentID = ipMockDefaultAlbumKey;
    return item1;
}

+(IPMockMediaItem *) itemWithDefaultValuesAndSongTitle:(NSString *)title {
    IPMockMediaItem *item = [IPMockHelper itemWithDefaultValues];
    item.MPMediaItemPropertyTitle = title;
    return item;
}

+(IPMockMediaItem *) itemWithOtherValues {
    IPMockMediaItem *item = [[IPMockMediaItem alloc] init];
    item.MPMediaItemPropertyTitle = ipMockSecondSongTitle;
    item.MPMediaItemPropertyArtist = ipMockSecondArtistName;
    item.MPMediaItemPropertyAlbumTitle  = ipMockSecondAlbumTitle;
    item.MPMediaItemPropertyAlbumPersistentID = ipMockSecondAlbumKey;
    return item;
}

+(IPMockMediaItemCollection *) itemCollectionWithSingleItem {
    IPMockMediaItemCollection *itemCol = [[IPMockMediaItemCollection alloc] init];
    itemCol.items = @[[IPMockHelper itemWithDefaultValues]];
    return itemCol;
}

+(IPMockMediaItemCollection *) itemCollectionWithOtherItem {
    IPMockMediaItemCollection *itemCol = [[IPMockMediaItemCollection alloc] init];
    itemCol.items = @[[IPMockHelper itemWithOtherValues]];
    return itemCol;
}

@end
