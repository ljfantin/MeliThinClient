//
//  UIAlertView+Meli.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 19/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (MTCMessage)
+ (instancetype)alertViewWithBuyConfirmationMessageWithDelegate:(id)delegate;
+ (instancetype)alertViewWithErrorConectionMessageWithDelegate:(id)delegate;
+ (instancetype)alertViewWithErrorGenericMessageWithDelegate:(id)delegate;

@end
