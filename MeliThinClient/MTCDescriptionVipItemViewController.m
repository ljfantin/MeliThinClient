//
//  MTCDescriptionVipItemViewController.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 11/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCDescriptionVipItemViewController.h"
#import "MTCMeliServiceApiImpl.h"
#import "MTCDescriptionDto.h"

@interface MTCDescriptionVipItemViewController ()

@end

@implementation MTCDescriptionVipItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		self.service = [[MTCMeliServiceApiImpl alloc] init];
		[_service setDelegate:self];
		_descriptionJsonTranslator = [[MTCDescriptionJsonTranslator alloc] init];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = NSLocalizedString(@"descripcion.title", nil);
	[self.service descriptionFromItemWithIdentifier:self.idItem];
}

/*- (void)viewWillAppear:(BOOL)animated
   {
    [super viewWillAppear:animated];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Volver" style:UIBarButtonItemStyleBordered target:nil action:nil];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWith                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(backAction)];
   }*/


#pragma mark Implementacion delegate MTCServiceApiDelegate

- (void)onPostExecute:(NSDictionary *)data;
{
	MTCDescriptionDto *dto = (MTCDescriptionDto *)[self.descriptionJsonTranslator objectFromDictionaryWithJson:data];
	[self.spinner stopAnimating];
	[self.descriptionWebView loadHTMLString:dto.text baseURL:nil];
}

- (void)onPreExecute {
	[self.spinner startAnimating];
}


@end
