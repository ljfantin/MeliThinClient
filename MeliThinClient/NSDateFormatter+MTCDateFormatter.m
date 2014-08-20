//
//  NSDateFormatter+MTCDateFormatter.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 20/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "NSDateFormatter+MTCDateFormatter.h"


@implementation NSDateFormatter (MTCDateFormatter)
- (NSString*)stringFromDateWithMTCFormat:(NSDate*)date
{
    NSDate * now = [[[NSDate alloc] init] autorelease];
    NSDateFormatter * formateDate = [[[NSDateFormatter alloc] init] autorelease];
    [formateDate setDateFormat:@"yyyy/MM/dd"];
    NSString * stringFromDate = [formateDate stringFromDate:date];
    NSString * stringFromDateNow = [formateDate stringFromDate:now];
    //Es el dia de hoy
    if ([stringFromDate isEqual:stringFromDateNow]) {
        NSDateFormatter * formatTime = [[NSDateFormatter alloc] init];
        [formatTime setDateFormat:@"HH:mm"];
        return[formatTime stringFromDate:date];
    } else {
        return [formateDate stringFromDate:date];
    }
}

@end
