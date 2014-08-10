//
//  MTCUIListItemResultTableViewCell.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 07/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCUIListItemResultTableViewCell.h"

@implementation MTCUIListItemResultTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_thumbnail release];
    [_title release];
    [_price release];
    [super dealloc];
}
@end
