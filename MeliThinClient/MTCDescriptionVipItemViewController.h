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
#import "MTCMeliServiceApi.h"

@interface MTCDescriptionVipItemViewController : UIViewController <MTCServiceApiDelegate>

@property (nonatomic, strong) id <MTCMeliServiceApi> service;
@property (nonatomic, strong) MTCDescriptionJsonTranslator *descriptionJsonTranslator;
@property (weak, nonatomic) IBOutlet UIWebView *descriptionWebView;
@property (strong, nonatomic) NSString *idItem;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
