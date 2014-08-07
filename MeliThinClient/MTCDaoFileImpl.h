//
//  MTCDaoFileImpl.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MTCDaoFileImpl <NSObject>


- (NSString*)cacheDirectoryName {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *cacheDirectoryName = [documentsDirectory stringByAppendingPathComponent:@"MdxImages"];
    return cacheDirectoryName;
}

- (void)cacheImage:(UIImage *)image inLocation:(NSString *)location
{
    NSString *fullPath = [[self cacheDirectoryName] stringByAppendingPathComponent:location];
    NSString *directoryPath = [fullPath stringByDeletingLastPathComponent];
    
    // Create directory if needed
    if (![[NSFileManager defaultManager] fileExistsAtPath:directoryPath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    // Check for file existence
    if(![[NSFileManager defaultManager] fileExistsAtPath:fullPath]) {
        NSData *imgData = UIImagePNGRepresentation(image);
        [imgData writeToFile:fullPath atomically:YES];
    }
}


@end
