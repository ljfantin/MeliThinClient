//
//  MTCConditiontTypeDto.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 09/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTCConditiontTypeDto : NSObject

+ (instancetype) initWithNew;
+ (instancetype) initWithUsed;
+ (instancetype) initWithUnespecified;

- (BOOL) isNew;
- (BOOL) isUsed;
- (BOOL) isUnespecified;
@end
