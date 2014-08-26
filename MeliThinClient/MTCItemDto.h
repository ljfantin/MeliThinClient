//
//  MTCItemDto.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 10/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCBuyingModeTypeDto.h"
#import "MTCConditiontTypeDto.h"
#import "MTCCurrencyTypeDto.h"


@interface MTCItemDto : NSObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, strong) NSNumber *price;

@property (nonatomic, strong) NSNumber *availableQuantity;

@property (nonatomic, strong) MTCBuyingModeTypeDto *buyingMode;
@property (nonatomic, strong) MTCConditiontTypeDto *condition;

@property (nonatomic, copy) NSArray *pictures;
@property (nonatomic, copy) NSArray *descriptions;
@property (nonatomic, strong) MTCCurrencyTypeDto *currency;

@property BOOL isFavorite;


@end
