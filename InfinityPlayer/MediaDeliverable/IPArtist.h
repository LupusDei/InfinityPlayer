//
//  IPArtist.h
//  InfinityPlayer
//
//  Created by Justin Martin on 9/17/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPMediaContainer.h"
@interface IPArtist : IPMediaContainer
+(IPArtist *) artistWithMediaCollection:(MPMediaItemCollection *)itemCol;

-(NSString *)name;

@end
