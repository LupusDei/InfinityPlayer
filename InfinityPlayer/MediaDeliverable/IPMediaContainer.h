//
//  IPMediaContainer.h
//  InfinityPlayer
//
//  Created by Justin Martin on 9/17/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPPlayable.h"

@interface IPMediaContainer : NSObject
@property (nonatomic, strong) MPMediaItemCollection *itemCollection;
@property (nonatomic, strong) IPPlayable *repItem;
@property (nonatomic, strong) NSArray *songs;

-(id) initWithItemCollection:(MPMediaItemCollection *)itemCol;

@end
