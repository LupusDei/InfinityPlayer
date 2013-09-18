//
//  IPMediaContainer.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/17/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPMediaContainer.h"

@implementation IPMediaContainer
@synthesize songs = _songs;

-(id) initWithItemCollection:(MPMediaItemCollection *)itemCol {
    self = [super init];
    if (self) {
        self.itemCollection = itemCol;
        self.repItem = [IPPlayable playableWithMediaItem:[itemCol representativeItem]];
    }
    return self;
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

@end
