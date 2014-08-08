//
//  MTCJsonParser.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MTCJsonTranslator <NSObject>

- (NSArray *) parse:(NSDictionary *)json;
@end
