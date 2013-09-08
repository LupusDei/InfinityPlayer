//
//  IPMockMediaItemCollection.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/7/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPMockMediaItemCollection.h"

@implementation IPMockMediaItemCollection

-(id) init {
    self = [super init];
    if (self) {
        self.items = @[];
    }
    return self;
}

-(int)count {
    return [self.items count];
}

-(MPMediaItem *) representativeItem {
    return [self.items lastObject];
}

@end
