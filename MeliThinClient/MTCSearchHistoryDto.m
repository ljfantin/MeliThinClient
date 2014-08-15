//
//  MTCSearchHistoryDto.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 13/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCSearchHistoryDto.h"

@implementation MTCSearchHistoryDto


+ (instancetype) mtcSearchHistoryDtoWithQuery:(NSString*)query data:(NSString*)date
{
    MTCSearchHistoryDto * instace = [[[MTCSearchHistoryDto alloc] init] autorelease];
    instace.query = query;
    instace.date = date;
    return instace;
}

+ (instancetype) mtcSearchHistoryDtoWithQuery:(NSString*)query
{
    MTCSearchHistoryDto * instace = [[[MTCSearchHistoryDto alloc] init] autorelease];
    instace.query = query;
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    instace.date = [dateFormatter stringFromDate:[[NSDate alloc] init]];
    [dateFormatter release];
    return instace;
}

- (void)dealloc
{
    [_query release];
    _query = nil;
    [_date release];
    _date = nil;
    [super dealloc];
}
@end
