//
//  MTCPicturesJsonTranslator.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCJsonTranslator.h"

@interface MTCPicturesJsonTranslator : NSObject<MTCJsonTranslator>

- (NSArray *) parse:(NSDictionary *)json;

@end