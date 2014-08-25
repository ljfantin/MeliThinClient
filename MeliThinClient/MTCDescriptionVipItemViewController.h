//
//  MTCDescriptionVipItemViewController.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 11/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTCServiceApiDelegate.h"
#import "MTCDescriptionJsonTranslator.h"
#import "MTCMeliDescriptionServiceDelegate.h"

@interface MTCDescriptionVipItemViewController : UIViewController <MTCMeliDescriptionServiceDelegate>

@property (nonatomic, retain) MTCDescriptionJsonTranslator *descriptionJsonTranslator;
@property (retain, nonatomic) IBOutlet UIWebView *descriptionWebView;
@property (retain, nonatomic) NSString *idItem;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
