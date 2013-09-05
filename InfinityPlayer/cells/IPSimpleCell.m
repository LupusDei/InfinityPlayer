//
//  IPSimpleCell.m
//  InfinityPlayer
//
//  Created by Justin Martin on 9/5/13.
//  Copyright (c) 2013 JMM. All rights reserved.
//

#import "IPSimpleCell.h"
#import "IPFontHelper.h"

@implementation IPSimpleCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"called");
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.textLabel.font = [IPFontHelper ipTitleFont];
        self.textLabel.textColor = [UIColor whiteColor];
        self.detailTextLabel.font = [IPFontHelper ipTitleFont];
        self.detailTextLabel.textColor = [UIColor whiteColor];
        
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
