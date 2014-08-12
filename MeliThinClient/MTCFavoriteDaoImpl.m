//
//  MTCFavoriteDaoImpl.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 12/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCFavoriteDaoImpl.h"

@interface MTCFavoriteDaoImpl ()
@property (nonatomic,retain) NSString * pathFile;
@property (nonatomic,retain) NSString * fileName;
@property (nonatomic,retain) NSString * keyCollectionId;

@property (nonatomic,retain) NSMutableDictionary *data;

@end

@implementation MTCFavoriteDaoImpl

+ (MTCFavoriteDaoImpl*)sharedInstance
{
    static MTCFavoriteDaoImpl *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[MTCFavoriteDaoImpl alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _fileName = @"favorites.plist";
        _keyCollectionId = @"favoritesIds";
        _pathFile = [self buildPathFile];
        _data = [[NSMutableDictionary alloc] initWithDictionary:@{_keyCollectionId: [NSMutableArray array]}];
        [self createFile];
    }
    return self;
}

- (void) save:(NSString*)id
{
    NSMutableArray * ids = (NSMutableArray *)self.data[self.keyCollectionId];
    [ids addObject:id];
    // self.data[self.keyCollectionId]=ids;
}

- (void) delete:(NSString*)id
{
    NSMutableArray * ids = (NSMutableArray *)self.data[self.keyCollectionId];
    [ids removeObject:id];
}

- (void) deleteAll
{
    NSMutableArray * ids = (NSMutableArray *)self.data[self.keyCollectionId];
    [ids removeAllObjects];
}

- (NSArray*) getAll
{
    NSMutableArray * ids = (NSMutableArray *)self.data[self.keyCollectionId];
    return ids;
}


- (BOOL) commit
{
    NSString *error;
    NSData *data = [NSPropertyListSerialization dataFromPropertyList:self.data
                                                              format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    [data writeToFile:self.pathFile atomically:YES];
    //si no tengo errores entonces comiteo bien
    return (error==nil);
}

- (void)createFile {
    
    //NSError * error;
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:self.pathFile]) {
        [fileManager createFileAtPath:self.pathFile contents:nil attributes:nil];
    }
}

- (NSString*)buildPathFile {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *pathFile = [documentsDirectory stringByAppendingPathComponent:self.fileName];
    return pathFile;
}

@end