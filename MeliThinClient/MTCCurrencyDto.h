//
//  MTCCurrencyDto.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 14/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTCCurrencyDto : NSObject

+ (instancetype) initWithArs;
+ (instancetype) initWithBrl;
+ (instancetype) initWithClp;
+ (instancetype) initWithCop;
+ (instancetype) initWithCrc;
+ (instancetype) initWithEur;
+ (instancetype) initWithMxn;
+ (instancetype) initWithPab;
+ (instancetype) initWithPen;
+ (instancetype) initWithUsd;
+ (instancetype) initWithUyu;
+ (instancetype) initWithVef;


- (BOOL) isArs;
- (BOOL) isBrl;
- (BOOL) isClp;
- (BOOL) isCop;
- (BOOL) isCrc;
- (BOOL) isEur;
- (BOOL) isMxn;
- (BOOL) isPab;
- (BOOL) isPen;
- (BOOL) isUsd;
- (BOOL) isUyu;
- (BOOL) isVef;

@end
