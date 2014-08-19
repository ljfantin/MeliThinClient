//
//  MTCPicturesJsonTranslator.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 08/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCPicturesJsonTranslator.h"
#import "UIImage+Utils.h"
#import "MTCPictureDto.h"

@implementation MTCPicturesJsonTranslator

- (NSArray *) arrayFromDictionaryWithJson:(NSDictionary *)json
{
    NSArray * jsonResults = json[@"pictures"];
    NSMutableArray * listPictures = [NSMutableArray array];
    for (NSDictionary * item in jsonResults) {
        //mapeo json
        NSString * identifier = [item objectForKey:@"id"];
        NSString * url = [item objectForKey:@"url"];
        
        //TODO esto debo tirarlo afuera
        UIImage * image = [UIImage imageWithUrl:url];
        
        //creo el dto para la picture
        MTCPictureDto * item = [MTCPictureDto mtcPictureDtoWithIdentifier:identifier url:url image:image];
        
        //agrego la picture
        [listPictures addObject:item];
    }
    
    return listPictures;
}

@end
