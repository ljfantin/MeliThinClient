//
//  MTCCurrencyDto.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 14/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTCCurrencyTypeDto : NSObject

@property (nonatomic,retain) NSString * id;
@property (nonatomic,retain) NSString * description;
@property (nonatomic,retain) NSString * symbol;
@property (nonatomic,retain) NSString * decimalPlaces;

+ (instancetype) mtcCurrencyTypeDtoWithIdentifier:(NSString*)id;

+ (instancetype) mtcCurrencyTypeDtoWithIdentifier:(NSString*)id description:(NSString*)description symbol:(NSString*)symbol decimalPlaces:(NSString*)decimalPlaces;

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
