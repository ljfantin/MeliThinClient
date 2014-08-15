//
//  MTCConditionTranslator.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 11/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCConditionTranslator.h"
#import "MTCConditiontTypeDto.h"

@implementation MTCConditionTranslator

- (NSObject *) objectFromDictionaryWithJson:(NSDictionary *)json
{
    NSString * conditionJsonValue = [json objectForKey:@"condition"];
    MTCConditiontTypeDto * condition = nil;
    if ([conditionJsonValue isEqual:@"new"])    {
        condition = [MTCConditiontTypeDto mtcConditiontTypeDtoWithNew];
    } else
    if ([conditionJsonValue isEqual:@"used"])    {
        condition = [MTCConditiontTypeDto mtcConditiontTypeDtoWithUsed];
    }
    else
    if ([conditionJsonValue isEqual:@"unespecified"])    {
        condition = [MTCConditiontTypeDto mtcConditiontTypeDtoWithUnespecified];
    }
    return condition;
}
@end
