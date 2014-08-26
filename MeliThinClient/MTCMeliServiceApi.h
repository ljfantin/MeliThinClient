//
//  MTCServiceMeliApi.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCServiceApiDelegate.h"
#import "MTCPagerList.h"

@protocol MTCMeliServiceApi <NSObject>

- (void)search:(NSString *)query pager:(MTCPagerList *)pager;
- (void)itemWithIdentifier:(NSString *)idItem attributes:(NSArray *)atributes;
- (void)itemsWithIdentifiers:(NSArray *)idsItem;
- (void)descriptionFromItemWithIdentifier:(NSString *)idIdem;

/*- (void) setDelegate:(id<MTCServiceApiDelegate>)delegate;
   - (id<MTCServiceApiDelegate>) getDelegate;*/
@property (nonatomic, weak) id <MTCServiceApiDelegate> delegate;
@end
