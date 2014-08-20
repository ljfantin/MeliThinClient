//
//  MTCSearchHistoryDto.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 13/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTCSearchHistoryDto : NSObject

@property (nonatomic,retain) NSString * query;
@property (nonatomic,retain) NSDate * date;

+ (instancetype) mtcSearchHistoryDtoWithQuery:(NSString*)query data:(NSDate*)date;
+ (instancetype) mtcSearchHistoryDtoWithQuery:(NSString*)query;

@end
