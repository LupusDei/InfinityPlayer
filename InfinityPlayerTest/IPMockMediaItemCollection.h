//
//  IPMockMediaItemCollection.h
//  InfinityPlayer
//
//  Created by Justin Martin on 9/7/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPMockMediaItem.h"

@class MPMediaItem;
@interface IPMockMediaItemCollection : NSObject

@property (nonatomic, strong) NSArray *items;

-(int) count;
-(MPMediaItem *)representativeItem;


@end
