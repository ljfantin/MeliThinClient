//
//  MTCMeliServiceApiImpl.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCMeliServiceApiImpl.h"
#import "MTCItemDto.h"

@implementation MTCMeliServiceApiImpl


+ (instancetype)sharedInstance {
    
    static dispatch_once_t onceToken;
    static id instance;
    
    dispatch_once(&onceToken,^{
        instance = [[MTCMeliServiceApiImpl alloc] init];
    });
    
    return instance;
}

-(NSArray*)search:(NSDictionary*)params {

    NSMutableArray * results = [[NSMutableArray alloc] init];
    UIImage * image = [UIImage imageNamed:@"image1.jpg"];
    
    [results addObject:[MTCItemDto initWithTitle:@"titulo 1" price:@"100" thumbnail:image]];
    
    [results addObject:[MTCItemDto initWithTitle:@"titulo 2" price:@"100" thumbnail:image]];
    
    [results addObject:[MTCItemDto initWithTitle:@"titulo 3" price:@"100" thumbnail:image]];
    
    [results addObject:[MTCItemDto initWithTitle:@"titulo 4" price:@"100" thumbnail:image]];
    
    [results addObject:[MTCItemDto initWithTitle:@"titulo 5" price:@"100" thumbnail:image]];
    
    [results addObject:[MTCItemDto initWithTitle:@"titulo 6" price:@"100" thumbnail:image]];
    
    [results addObject:[MTCItemDto initWithTitle:@"titulo 7" price:@"100" thumbnail:image]];
    
    [results addObject:[MTCItemDto initWithTitle:@"titulo 8" price:@"100" thumbnail:image]];
    
    [results addObject:[MTCItemDto initWithTitle:@"titulo 9" price:@"100" thumbnail:image]];
    
     [results addObject:[MTCItemDto initWithTitle:@"titulo 10" price:@"100" thumbnail:image]];
    
    return results;
}

@end
