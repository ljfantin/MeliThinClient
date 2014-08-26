//
//  MTCSearchHistoryDto.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 13/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCSearchHistoryDto.h"

@implementation MTCSearchHistoryDto


+ (instancetype)mtcSearchHistoryDtoWithQuery:(NSString *)query data:(NSDate *)date {
	MTCSearchHistoryDto *instace = [[MTCSearchHistoryDto alloc] init];
	instace.query = query;
	instace.date = date;
	return instace;
}

+ (instancetype)mtcSearchHistoryDtoWithQuery:(NSString *)query {
	MTCSearchHistoryDto *instace = [[MTCSearchHistoryDto alloc] init];
	instace.query = query;
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy/MM/dd hh:mm"];
	NSDate *now = [[NSDate alloc] init];
	instace.date = now;
	return instace;
}

@end
