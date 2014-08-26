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

@property (strong, nonatomic) NSString *identifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSNumber *price;

@property (nonatomic, strong) NSNumber *availableQuantity;

@property (nonatomic, strong) MTCBuyingModeTypeDto *buyingMode;
@property (nonatomic, strong) MTCConditiontTypeDto *condition;

@property (strong, nonatomic) NSArray *pictures;
@property (strong, nonatomic) NSArray *descriptions;
@property (strong, nonatomic) MTCCurrencyTypeDto *currency;

@property BOOL isFavorite;


@end
