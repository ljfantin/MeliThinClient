//
//  MTCMeliDescriptionService.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 25/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCMeliServiceApiImpl.h"

@interface MTCMeliDescriptionService : MTCMeliServiceApiImpl

@property (nonatomic, copy) NSString *path;

- (void)descriptionFromItemWithIdentifier:(NSString *)idIdem;

@end
