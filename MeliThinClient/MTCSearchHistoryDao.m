//
//  MTCSearchHistorialDao.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 13/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCSearchHistoryDao.h"
#import "MTCSearchHistoryDto.h"

@interface MTCSearchHistoryDao ()
@property (nonatomic,retain) NSString * pathFile;
@property (nonatomic,retain) NSString * fileName;
@property (nonatomic,retain) NSString * keyCollectionId;

@property (nonatomic,retain) NSMutableDictionary *data;
@end

@implementation MTCSearchHistoryDao

+ (MTCSearchHistoryDao*)sharedInstance
{
    static MTCSearchHistoryDao *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[MTCSearchHistoryDao alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _fileName = @"history.plist";
        _keyCollectionId = @"historyIds";
        [self buildPathFile];
        [self createFile];
    }
    return self;
}

-(NSArray*) getAll{
    //TODO Si le pongo autorelease pincha
    NSMutableArray * result = [NSMutableArray array];
    
    NSDictionary * history = (NSDictionary *)self.data[self.keyCollectionId];
    for( NSString * key in [history allKeys])
    {
        [result addObject:[MTCSearchHistoryDto initWith:key data:[history objectForKey:key]]];
    }
    return result;
}

- (void) deleteAll
{
    NSMutableDictionary * history = (NSMutableDictionary *)self.data[self.keyCollectionId];
    [history removeAllObjects];
}

- (void) save:(MTCSearchHistoryDto*)dto
{
    NSMutableDictionary * history = (NSMutableDictionary *)self.data[self.keyCollectionId];
    [history setValue:dto.date forKey:dto.query];
}

- (BOOL) commit
{
    NSString *error;
    NSData *dataToSave = [NSPropertyListSerialization dataFromPropertyList:self.data
                                                              format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    [dataToSave writeToFile:self.pathFile atomically:YES];
    return YES;
}


- (void)createFile {
    
    //NSError * error;
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:self.pathFile]) {
        [fileManager createFileAtPath:self.pathFile contents:nil attributes:nil];
        _data = [[NSMutableDictionary alloc] initWithDictionary:@{_keyCollectionId: [NSMutableDictionary dictionary]}];
    }
    else
    {
        _data = [[NSMutableDictionary alloc] initWithContentsOfFile:self.pathFile];
        if (_data == nil)
            _data = [[NSMutableDictionary alloc] initWithDictionary:@{_keyCollectionId: [NSMutableDictionary dictionary]}];
    }
}

- (void)buildPathFile {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    self.pathFile = [documentsDirectory stringByAppendingPathComponent:self.fileName];
}


@end
