//
//  MTCServiceApiDelegate.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 07/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MTCServiceApiDelegate <NSObject>

@optional

- (void)onPreExecute;

- (void)onHandleError:(NSError *)error;

- (void)onHandleErrorWithOutConnection;
@end
