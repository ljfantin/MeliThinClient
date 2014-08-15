//
//  MTCConditiontTypeDto.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 09/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCConditiontTypeDto.h"


@interface MTCConditiontTypeDto ()
typedef NS_ENUM(NSInteger, CONDITION_TYPE) {NEW, USED, UNESPECIFIED};
@property CONDITION_TYPE type;
@end


@implementation MTCConditiontTypeDto

+ (instancetype) mtcConditiontTypeDtoWithNew
{
    MTCConditiontTypeDto * instance = [[[MTCConditiontTypeDto alloc] init] autorelease];
    instance.type = NEW;
    return instance;
}

+ (instancetype) mtcConditiontTypeDtoWithUsed
{
    MTCConditiontTypeDto * instance = [[[MTCConditiontTypeDto alloc] init] autorelease];
    instance.type = USED;
    return instance;
}

+ (instancetype) mtcConditiontTypeDtoWithUnespecified
{
    MTCConditiontTypeDto * instance = [[[MTCConditiontTypeDto alloc] init] autorelease];
    instance.type = UNESPECIFIED;
    return instance;
}

- (BOOL) isNew{
    return (self.type == NEW);
}

- (BOOL) isUsed{
    return (self.type == USED);
}

- (BOOL) isUnespecified{
    return (self.type == UNESPECIFIED);
}

@end
