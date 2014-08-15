//
//  MTCSearchHistorialDao.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 13/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCSearchHistoryDto.h"

@interface MTCSearchHistoryManager : NSObject

+ (MTCSearchHistoryManager*)sharedInstance;
-(NSArray*) arrayWithObjects;
-(void) deleteAllSearchHistory;
-(void) saveSearchHistory:(MTCSearchHistoryDto*)dto;
- (BOOL) commit;
@end
