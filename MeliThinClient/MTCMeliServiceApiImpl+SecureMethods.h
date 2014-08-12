//
//  MTCMeliServiceApiImpl+SecureMethods.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 12/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCMeliServiceApiImpl.h"
#import "MTCItemDto.h"

@interface MTCMeliServiceApiImpl (SecureMethods)

- (void) getAllBookmarks:(NSString*)token;
- (void) addBookmark:(MTCItemDto*)item withToken:(NSString*)token;
- (void) removeBookmark:(MTCItemDto*)item withToken:(NSString*)token;
- (void) removeAllBookmark:(NSString*)token;

@end
