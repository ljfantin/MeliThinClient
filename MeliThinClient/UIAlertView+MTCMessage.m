//
//  UIAlertView+Meli.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 19/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "UIAlertView+MTCMessage.h"

@implementation UIAlertView (MTCMessage)

+ (instancetype)alertViewWithBuyConfirmationMessageWithDelegate:(id)delegate {
	NSString *title = NSLocalizedString(@"view.confirmation.title", nil);
	NSString *message = NSLocalizedString(@"view.confirmation.message", nil);
	NSString *buttonOkTitle = NSLocalizedString(@"view.confirmation.buttonOk", nil);
	NSString *buttonCancelTitle = NSLocalizedString(@"view.confirmation.buttonCancel", nil);
	return [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:buttonCancelTitle otherButtonTitles:buttonOkTitle, nil];
}

+ (instancetype)alertViewWithErrorConectionMessageWithDelegate:(id)delegate {
	NSString *title = NSLocalizedString(@"view.errorconection.title", nil);
	NSString *message = NSLocalizedString(@"view.errorconection.message", nil);
	NSString *buttonOkTitle = NSLocalizedString(@"view.confirmation.buttonOk", nil);
	return [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:buttonOkTitle otherButtonTitles:nil];
}

+ (instancetype)alertViewWithErrorGenericMessageWithDelegate:(id)delegate {
	NSString *title = NSLocalizedString(@"view.errorgeneric.title", nil);
	NSString *message = NSLocalizedString(@"view.errorgeneric.message", nil);
	NSString *buttonOkTitle = NSLocalizedString(@"view.confirmation.buttonOk", nil);
	return [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:buttonOkTitle otherButtonTitles:nil];
}

@end
