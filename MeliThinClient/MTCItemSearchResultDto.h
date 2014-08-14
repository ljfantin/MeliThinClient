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



@property (nonatomic,retain) NSString * id;
@property (nonatomic,retain) NSString * tittle;
@property (nonatomic,retain) NSNumber * price;
@property (nonatomic,retain) NSString * subtitle;
@property (nonatomic,retain) NSNumber * availableQuantity;
@property (nonatomic,retain) UIImage * thumbnail;
@property (nonatomic,retain) MTCCurrencyTypeDto* currency;

@property (nonatomic,retain) MTCBuyingModeTypeDto * buyingMode;
@property (nonatomic,retain) MTCConditiontTypeDto * condition;


+(instancetype) initWithId:(NSString*)id title:(NSString *) title price:(NSNumber*) price subtitle:(NSString*) subtitle  availableQuantity:(NSNumber*)quantity condition:(MTCConditiontTypeDto*)condition buyingMode:(MTCBuyingModeTypeDto*)buyingMode currency:(MTCCurrencyTypeDto*)currency thumbnail:(UIImage*) image;

@end
