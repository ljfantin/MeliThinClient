//
//  MTCItemDao.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 11/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCItemDao.h"
#import "MTCItemDto.h"
#import "MTCPictureDto.h"

@interface MTCItemDao ()
@property (nonatomic,retain) NSString * pathFile;
@property (nonatomic,retain) NSString * fileName;
@end

@implementation MTCItemDao

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.fileName = @"favorites.plist";
        _pathFile = [self buildPathFile];
        [self createFile];
    }
    return self;
}

- (id) load:(NSString*)id   {
    
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile: self.pathFile];
    MTCItemDto * dto = [data objectForKey:id];
    [data release];
    return dto;
}


- (NSEnumerator*) findAll {
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile: self.pathFile];
    
    NSEnumerator * values = [data objectEnumerator];
    
    [data release];
    return values;
}

- (void)dealloc
{
    [_pathFile release];
    [super dealloc];
}


- (NSString*)buildPathFile {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *pathFile = [documentsDirectory stringByAppendingPathComponent:self.fileName];
    return pathFile;
}

- (void)createFile {
    
    //NSError * error;
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:self.pathFile]) {
        //NSString *bundle = [[NSBundle mainBundle] pathForResource:@"favorites" ofType:@"plist"];
        [fileManager createFileAtPath:self.pathFile contents:nil attributes:nil];
        //[fileManager copyItemAtPath:bundle toPath:self.pathFile error:&error]; //6
    }
}

- (BOOL) save:(id)object
{
    MTCItemDto * item = object;
    
    //falta buying mode y condition
    NSMutableArray * picturesPaths = [[NSMutableArray alloc] init];
    for (MTCPictureDto * pic in item.pictures)   {
        NSDictionary * picValues = @{@"id":pic.id,@"path":pic.url};
        [picturesPaths addObject:picValues];
    }
    
    //description
    /*NSMutableArray * descriptions = [[NSMutableArray alloc] init];
    for (MTCPictureDto * pic in item.descriptions)   {
        NSDictionary * picValues = @{@"id":pic.id,@"path":pic.url};
        [picturesPaths addObject:picValues];
    }*/
    
    //[item.pictures];
    NSDictionary * dictionary = @{@"id":item.id,@"title":item.title,@"subtitle":item.subtitle,@"price":item.price,@"available_quantity":item.availableQuantity,@"pictures":picturesPaths};
    
    NSString *error;

    NSData *data = [NSPropertyListSerialization dataFromPropertyList:dictionary
                                                             format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    /*NSFileHandle * fileHandler = [NSFileHandle fileHandleForWritingAtPath:self.pathFile];
    [fileHandler seekToEndOfFile];
    [fileHandler writeData:data];
    [fileHandler closeFile];*/
    [data writeToFile:self.pathFile atomically:YES];
    //[NSKeyedArchiver archiveRootObject:object toFile:self.pathFile];
    
    
    return (error==nil);
}


@end
