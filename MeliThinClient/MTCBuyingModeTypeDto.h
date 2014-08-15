//
//  MTCBuyingModeTypeDto.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 09/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTCBuyingModeTypeDto : NSObject

+ (instancetype) mtcBuyingModeTypeDtoWithBuyItNow;
+ (instancetype) mtcBuyingModeTypeDtoWithAuction;
+ (instancetype) mtcBuyingModeTypeDtoWithClassified;


- (BOOL) isBuyItNow;
- (BOOL) isAuction;
- (BOOL) isClassified;


@end
