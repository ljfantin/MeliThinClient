//
//  MTCSearchJsonTranslator.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCJsonTranslator.h"
#import "MTCSearchResultJsonTranslator.h"

@interface MTCSearchJsonTranslator : NSObject <MTCJsonTranslator>
@property (nonatomic, strong) MTCSearchResultJsonTranslator *resultJsonTranslator;
@end
