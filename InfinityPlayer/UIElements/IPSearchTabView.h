//
//  IPSearchTabView.h
//  InfinityPlayer
//
//  Created by Justin Martin on 9/6/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import <UIKit/UIKit.h>

enum {
    IPSearchTabSongs = 0,
    IPSearchTabArtists = 1,
    IPSearchTabAlbumbs = 2
};

typedef void (^IPSearchTabButtonAction) (void);

@interface IPSearchTabView : UIView

-(id)initWithY:(float)y;

-(void) setActionForSongsButton:(IPSearchTabButtonAction)songsAction;
-(void) setActionForArtistsButton:(IPSearchTabButtonAction)artistsAction;
-(void) setActionForAlbumsButton:(IPSearchTabButtonAction)albumsAction;

@end
