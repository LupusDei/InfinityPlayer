//
//  IPSearchTabView.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/6/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPSearchTabView.h"
#import "IPFontHelper.h"

@implementation IPSearchTabView {
    IPSearchTabButtonAction _songsAction;
    IPSearchTabButtonAction _artistsAction;
    IPSearchTabButtonAction _albumsAction;
    UIView *selectionView;
    UIButton *songSortTab;
    UIButton *albumSortTab;
    UIButton *artistSortTab;
}

- (id)initWithY:(float)y
{
    self = [super initWithFrame:CGRectMake(-1, y, ipStandardWidth + 2, ipNavbarHeight)];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        songSortTab = [[UIButton alloc] initWithFrame:CGRectMake(-1, 0, self.width / 3 + 1, self.height)];
        songSortTab.backgroundColor = [UIColor clearColor];
        songSortTab.layer.borderColor = [UIColor whiteColor].CGColor;
        songSortTab.layer.borderWidth = 0.5;
        [songSortTab setTitle:@"Songs" forState:UIControlStateNormal];
        [songSortTab.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [songSortTab.titleLabel setTextColor:[UIColor whiteColor]];
        [songSortTab.titleLabel setFont:[IPFontHelper ipTitleFont]];
        songSortTab.titleLabel.backgroundColor = [UIColor clearColor];
        [songSortTab addTarget:self action:@selector(songsButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        
        
        artistSortTab = [[UIButton alloc] initWithFrame:CGRectMake(songSortTab.x + songSortTab.width, 0, self.width / 3 + 1, self.height)];
        artistSortTab.backgroundColor = [UIColor clearColor];
        artistSortTab.layer.borderColor = [UIColor whiteColor].CGColor;
        artistSortTab.layer.borderWidth = 0.5;
        [artistSortTab setTitle:@"Artists" forState:UIControlStateNormal];
        [artistSortTab.titleLabel setFont:[IPFontHelper ipTitleFont]];
        [artistSortTab.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [artistSortTab.titleLabel setTextColor:[UIColor whiteColor]];
        artistSortTab.titleLabel.backgroundColor = [UIColor clearColor];
        [artistSortTab addTarget:self action:@selector(artistsButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        
        albumSortTab = [[UIButton alloc] initWithFrame:CGRectMake(artistSortTab.x + artistSortTab.width, 0, self.width / 3 + 1, self.height)];
        albumSortTab.backgroundColor = [UIColor clearColor];
        albumSortTab.layer.borderColor = [UIColor whiteColor].CGColor;
        albumSortTab.layer.borderWidth = 0.5;
        [albumSortTab setTitle:@"Albums" forState:UIControlStateNormal];
        [albumSortTab.titleLabel setFont:[IPFontHelper ipTitleFont]];
        [albumSortTab.titleLabel setTextColor:[UIColor whiteColor]];
        [albumSortTab.titleLabel setTextAlignment:NSTextAlignmentCenter];
        albumSortTab.titleLabel.backgroundColor = [UIColor clearColor];
        [albumSortTab addTarget:self action:@selector(albumsButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        
        selectionView = [[UIView alloc] initWithFrame:CGRectMake(artistSortTab.x, 0, self.width / 3 + 1, self.height)];
        selectionView.backgroundColor = [UIColor lightGrayColor];
        selectionView.alpha = 0.6;
        
        [self addSubview:selectionView];
        [self addSubview:songSortTab];
        [self addSubview:artistSortTab];
        [self addSubview:albumSortTab];
    }
    return self;
}

-(void) setActionForSongsButton:(IPSearchTabButtonAction)songsAction {
    _songsAction = songsAction;
}

-(void) setActionForArtistsButton:(IPSearchTabButtonAction)artistsAction {
    _artistsAction = artistsAction;
}

-(void) setActionForAlbumsButton:(IPSearchTabButtonAction)albumsAction {
    _albumsAction = albumsAction;
}

-(void) songsButtonPressed {
    [UIView animateWithDuration:0.4 animations:^{
        selectionView.center = songSortTab.center;
    }];
    if (_songsAction) {
        _songsAction();
    }
}

-(void) artistsButtonPressed {
    [UIView animateWithDuration:0.4 animations:^{
        selectionView.center = artistSortTab.center;
    }];
    if (_artistsAction) {
        _artistsAction();
    }
}

-(void) albumsButtonPressed {
    [UIView animateWithDuration:0.4 animations:^{
        selectionView.center = albumSortTab.center;
    }];
    if (_albumsAction) {
        _albumsAction();
    }
}

@end
