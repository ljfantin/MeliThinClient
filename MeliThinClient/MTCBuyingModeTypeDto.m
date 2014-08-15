//
//  MTCBuyingModeTypeDto.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 09/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCBuyingModeTypeDto.h"

@interface MTCBuyingModeTypeDto ()
    typedef NS_ENUM(NSInteger, BUYING_MODE_TYPE) {BUY_IT_NOW, AUCTION, CLASSIFIED};
    @property BUYING_MODE_TYPE type;
@end

@implementation MTCBuyingModeTypeDto

+ (instancetype) mtcBuyingModeTypeDtoWithBuyItNow   {

    MTCBuyingModeTypeDto * instance = [[[MTCBuyingModeTypeDto alloc] init] autorelease];
    instance.type = BUY_IT_NOW;
    return instance;
}

+ (instancetype) mtcBuyingModeTypeDtoWithAuction    {
    MTCBuyingModeTypeDto * instance = [[[MTCBuyingModeTypeDto alloc] init] autorelease];
    instance.type = AUCTION;
    return instance;
}

+ (instancetype) mtcBuyingModeTypeDtoWithClassified {
    MTCBuyingModeTypeDto * instance = [[[MTCBuyingModeTypeDto alloc] init] autorelease];
    instance.type = CLASSIFIED;
    return instance;
}


- (BOOL) isBuyItNow{
    return (self.type == BUY_IT_NOW);
}

- (BOOL) isAuction{
    return (self.type == AUCTION);
}

- (BOOL) isClassified{
    return (self.type == CLASSIFIED);
}

@end
