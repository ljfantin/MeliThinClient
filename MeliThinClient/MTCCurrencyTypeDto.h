//
//  MTCCurrencyDto.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 14/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTCCurrencyTypeDto : NSObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *symbol;
@property (nonatomic, copy) NSString *decimalPlaces;

+ (instancetype)mtcCurrencyTypeDtoWithIdentifier:(NSString *)identifier;

+ (instancetype)mtcCurrencyTypeDtoWithIdentifier:(NSString *)identifier description:(NSString *)description symbol:(NSString *)symbol decimalPlaces:(NSString *)decimalPlaces;

- (BOOL)isArs;
- (BOOL)isBrl;
- (BOOL)isClp;
- (BOOL)isCop;
- (BOOL)isCrc;
- (BOOL)isEur;
- (BOOL)isMxn;
- (BOOL)isPab;
- (BOOL)isPen;
- (BOOL)isUsd;
- (BOOL)isUyu;
- (BOOL)isVef;

@end
