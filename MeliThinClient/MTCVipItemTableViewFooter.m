//
//  MTCVipItemTableViewFooter.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 09/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCVipItemTableViewFooter.h"

@implementation MTCVipItemTableViewFooter

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)dealloc {
    [_buttonBuy release];
    [_labelAvailable release];
    [super dealloc];
}
@end
