//
//  MTCSearchHistorialDao.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 13/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCSearchHistoryDto.h"

@interface MTCSearchHistoryDao : NSObject

+ (MTCSearchHistoryDao*)sharedInstance;
-(NSArray*) getAll;
-(void) deleteAll;
-(void) save:(MTCSearchHistoryDto*)dto;
- (BOOL) commit;
@end
