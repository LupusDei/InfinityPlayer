//
//  IPMPMediaPlayerSpy.h
//  InfinityPlayer
//
//  Created by Justin Martin on 9/21/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IPMPMusicPlayerSpy : NSObject
@property (nonatomic, strong) NSArray *itemCollection;

+(IPMPMusicPlayerSpy *) spy;

-(void) setQueueWithItemCollection:(NSArray *)array;


@end
