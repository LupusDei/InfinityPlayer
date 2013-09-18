//
//  IPArtist.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/17/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPArtist.h"

@implementation IPArtist

+(IPArtist *) artistWithMediaCollection:(MPMediaItemCollection *)itemCol {
    IPArtist *artist = [[IPArtist alloc] initWithItemCollection:itemCol];
    return artist;
}

-(NSString *)name {
    return self.repItem.artistName;
}

@end
