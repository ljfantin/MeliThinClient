//
//  MTCSearchJsonTranslator.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCSearchJsonTranslator.h"
#import "MTCItemDto.h"
#import "UIImage+Utils.h"

@implementation MTCSearchJsonTranslator

- (NSArray *) parse:(NSDictionary *)json
{
    NSArray * jsonResults = json[@"results"];
    NSMutableArray * listItems = [NSMutableArray array];
    for (NSDictionary * item in jsonResults) {
        //mapeo json
        NSString * id = [item objectForKey:@"id"];
        NSString * title = [item objectForKey:@"title"];
        NSString * subtitle = [item objectForKey:@"subtitle"];
        NSNumber * price = [item objectForKey:@"price"];
        NSNumber * quantity = [item objectForKey:@"available_quantity"];
        NSString * condition = [item objectForKey:@"condition"];
        NSString * urlThumbnail = [item objectForKey:@"thumbnail"];
        UIImage * image = [UIImage imageWithUrl:urlThumbnail];
        
        //creo el dto
        MTCItemDto * item = [MTCItemDto initWithId:id title:title price:price subtitle:subtitle availableQuantity:quantity condition:condition thumbnail:image];
        
        //agrego el item
        [listItems addObject:item];
    }
    
    return listItems;
}

@end
