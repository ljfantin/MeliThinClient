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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.service = [[[MTCMeliServiceApiImpl alloc] init] autorelease];
        [_service setDelegate:self];
        _descriptionJsonTranslator = [[MTCDescriptionJsonTranslator alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"descripcion.title", nil);
    [self.service getDescriptionFromItem:self.idItem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Implementacion delegate MTCServiceApiDelegate

- (void) onPostExecute:(NSDictionary *) data;
{
    MTCDescriptionDto * dto = (MTCDescriptionDto *) [self.descriptionJsonTranslator translateObject:data];
    [self.descriptionWebView loadHTMLString:dto.text baseURL:nil];
}

- (void)dealloc
{
    [_service release];
    [_descriptionJsonTranslator release];
    [_descriptionWebView release];
    [_idItem release];
    [super dealloc];
}

@end
