//
//  MTCSearchHistoryDto.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 13/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCSearchHistoryDto.h"

@implementation MTCSearchHistoryDto


+ (instancetype) initWith:(NSString*)query data:(NSString*)date
{
    MTCSearchHistoryDto * instace = [[[MTCSearchHistoryDto alloc] init] autorelease];
    instace.query = query;
    instace.date = date;
    return instace;
}

+ (instancetype) initWith:(NSString*)query
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
    [_date release];
    [super dealloc];
}
@end
