//
//  MTCUIListItemResultTableViewCell.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 07/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCUIListItemResultTableViewCell.h"

@implementation MTCUIListItemResultTableViewCell

- (void)dealloc {
    [_thumbnail release];
    _thumbnail = nil;
    [_title release];
    _title = nil;
    [_price release];
    _price = nil;
    [super dealloc];
}
@end
