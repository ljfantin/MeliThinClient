//
//  MTCMeliDescriptionServiceDelegate.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 25/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCDescriptionDto.h"

@protocol MTCMeliDescriptionServiceDelegate <MTCServiceApiDelegate>

- (void)onPostExecute:(MTCDescriptionDto *)item;

@end
