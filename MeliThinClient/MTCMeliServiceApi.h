//
//  MTCMeliServiceApiImpl.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCSearchJsonTranslator.h"
#import "MTCItemTranslator.h"
#import "AFHTTPRequestOperation.h"

@interface MTCMeliServiceApi : NSObject

@property (nonatomic, copy) NSString *url;

/*
   - (void)handleErrorWithOutConnection;
   - (void)handleError:(NSError *)error;
   - (BOOL)hasConecction;
 */
- (void)cancelOperation;

@end
