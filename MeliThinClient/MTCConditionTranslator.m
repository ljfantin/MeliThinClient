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

- (NSObject *) translateObject:(NSDictionary *)json
{
    NSString * conditionJsonValue = [json objectForKey:@"condition"];
    MTCConditiontTypeDto * condition = nil;
    if ([conditionJsonValue isEqual:@"new"])    {
        condition = [MTCConditiontTypeDto initWithNew];
    } else
    if ([conditionJsonValue isEqual:@"used"])    {
        condition = [MTCConditiontTypeDto initWithUsed];
    }
    else
    if ([conditionJsonValue isEqual:@"unespecified"])    {
        condition = [MTCConditiontTypeDto initWithUnespecified];
    }
    return condition;
}
@end
