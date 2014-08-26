//
//  MTCDescriptionDto.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 11/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTCDescriptionDto : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *plainText;

+ (instancetype)mtcDescriptionDtoWithText:(NSString *)text plainText:(NSString *)plainText;

@end
