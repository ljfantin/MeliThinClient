//
//  MTCPagetList.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTCPagerList : NSObject

@property (nonatomic) NSInteger total;
@property (nonatomic) NSInteger offset;
@property (nonatomic) NSInteger limit;

- (void) resetToValuesDefault;
@end
