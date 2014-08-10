//
//  MTCPagetList.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCPagerList.h"

@implementation MTCPagerList

- (instancetype)init
{
    self = [super init];
    if (self) {
        _total = 10;
        _offset = 0;
        _limit = 0;
    }
    return self;
}
@end
