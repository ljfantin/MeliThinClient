//
//  MTCMeliServiceApiItemDelegate.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 25/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCItemDto.h"
#import "MTCServiceApiDelegate.h"

@protocol MTCMeliServiceApiItemDelegate <MTCServiceApiDelegate>

- (void)onPostExecute:(MTCItemDto *)item;

@end
