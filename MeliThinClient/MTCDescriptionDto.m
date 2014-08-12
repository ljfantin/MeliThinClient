//
//  MTCDescriptionDto.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 11/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCDescriptionDto.h"

@implementation MTCDescriptionDto

+(instancetype) initWith:(NSString*)text plainText:(NSString*)plainText{
    MTCDescriptionDto * instance = [[[MTCDescriptionDto alloc] init] autorelease];
    instance.text = text;
    instance.plainText = plainText;
    return instance;
}

- (void)dealloc
{
    [_text release];
    [_plainText release];
    [super dealloc];
}
@end
