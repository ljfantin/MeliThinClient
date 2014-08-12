//
//  MTCFavoriteDao.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 12/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MTCFavoriteDao <NSObject>


- (void) save:(NSString*)id;
- (void) delete:(NSString*)id;
- (void) deleteAll;
- (NSArray*) getAll;
- (BOOL) commit;
@end
