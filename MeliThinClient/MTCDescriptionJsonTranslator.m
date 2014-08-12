//
//  MTCDescriptionJsonTranslator.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 11/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCDescriptionJsonTranslator.h"
#import "MTCDescriptionDto.h"

@implementation MTCDescriptionJsonTranslator

- (NSObject *) translateObject:(NSDictionary *)json
{
    NSString * text = [json objectForKey:@"text"];
    NSString * plainText = [json objectForKey:@"plain_text"];
    return [MTCDescriptionDto initWith:text plainText:plainText];
}

@end
