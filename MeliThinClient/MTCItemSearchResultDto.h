//
//  MTCItemDto.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCConditiontTypeDto.h"
#import "MTCBuyingModeTypeDto.h"
#import "MTCCurrencyTypeDto.h"
#import "MTCCurrencyTypeDto.h"

@interface MTCItemSearchResultDto : NSObject


@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *tittle;
@property (nonatomic, copy) NSNumber *price;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSNumber *availableQuantity;
@property (nonatomic, copy) NSString *urlThumbnail;
@property (nonatomic, strong) MTCCurrencyTypeDto *currency;
@property (nonatomic, strong) MTCBuyingModeTypeDto *buyingMode;
@property (nonatomic, strong) MTCConditiontTypeDto *condition;


+ (instancetype)mtcItemSearchResultDtoWithIdentifier:(NSString *)identifier title:(NSString *)title price:(NSNumber *)price subtitle:(NSString *)subtitle availableQuantity:(NSNumber *)quantity condition:(MTCConditiontTypeDto *)condition buyingMode:(MTCBuyingModeTypeDto *)buyingMode currency:(MTCCurrencyTypeDto *)currency urlThumbnail:(NSString *)urlThumbnail;

@end
