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


@interface MTCItemDto : NSObject

@property (retain,nonatomic) NSString * id;
@property (nonatomic,retain) NSString * title;
@property (nonatomic,retain) NSString * subtitle;
@property (nonatomic,retain) NSNumber * price;

@property (nonatomic,retain) NSNumber * availableQuantity;

@property (nonatomic,retain) MTCBuyingModeTypeDto * buyingMode;
@property (nonatomic,retain) MTCConditiontTypeDto * condition;

@property (retain,nonatomic) NSArray * pictures;
@property (retain,nonatomic) NSArray * descriptions;

@end
