//
//  NSDateFormatter+MTCDateFormatter.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 20/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (MTCDateFormatter)
- (NSString*)stringFromDateWithMTCFormat:(NSDate*)date;
@end
