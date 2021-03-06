//
//  MTCSearchHistorialDao.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 13/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCSearchHistoryManager.h"
#import "MTCSearchHistoryDto.h"

@interface MTCSearchHistoryManager ()
@property (nonatomic, strong) NSString *pathFile;
@property (nonatomic, strong) NSString *fileName;
@property (nonatomic, strong) NSString *keyCollectionId;
@property (nonatomic, strong) NSMutableDictionary *data;
@end

@implementation MTCSearchHistoryManager

+ (MTCSearchHistoryManager *)sharedInstance {
	static MTCSearchHistoryManager *_sharedInstance = nil;
	static dispatch_once_t oncePredicate;
	dispatch_once(&oncePredicate, ^{
	    _sharedInstance = [[MTCSearchHistoryManager alloc] init];
	});
	return _sharedInstance;
}

- (instancetype)init {
	self = [super init];
	if (self) {
		_fileName = @"history.plist";
		_keyCollectionId = @"historyIds";
		[self buildPathFile];
		[self createFile];
	}
	return self;
}

- (NSArray *)arrayWithObjects {
	NSMutableArray *result = [NSMutableArray array];
	NSDictionary *history = self.data[self.keyCollectionId];
	//obtengo el diccionario ordenado por sus valores.
	//no es la mejor manera, ver como cambiar el compare
	NSArray *keywords = [[(NSArray *)[history keysSortedByValueUsingSelector:@selector(compare:)] reverseObjectEnumerator] allObjects];
	for (NSString *key in keywords) {
		NSDate *date = [history objectForKey:key];
		[result addObject:[MTCSearchHistoryDto mtcSearchHistoryDtoWithQuery:key data:date]];
	}
	return result;
}

- (void)deleteAllSearchHistory {
	NSMutableDictionary *history = (NSMutableDictionary *)self.data[self.keyCollectionId];
	[history removeAllObjects];
}

- (void)saveSearchHistory:(MTCSearchHistoryDto *)dto {
	NSMutableDictionary *history = (NSMutableDictionary *)self.data[self.keyCollectionId];
	[history setValue:dto.date forKey:dto.query];
}

- (BOOL)commit {
	NSString *error;
	NSData *dataToSave = [NSPropertyListSerialization dataFromPropertyList:self.data
	                                                                format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
	[dataToSave writeToFile:self.pathFile atomically:YES];
	return YES;
}

- (void)createFile {
	//NSError * error;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if (![fileManager fileExistsAtPath:self.pathFile]) {
		[fileManager createFileAtPath:self.pathFile contents:nil attributes:nil];
		_data = [[NSMutableDictionary alloc] initWithDictionary:@{ _keyCollectionId: [NSMutableDictionary dictionary] }];
	}
	else {
		_data = [[NSMutableDictionary alloc] initWithContentsOfFile:self.pathFile];
		if (_data == nil)
			_data = [[NSMutableDictionary alloc] initWithDictionary:@{ _keyCollectionId: [NSMutableDictionary dictionary] }];
	}
}

- (void)buildPathFile {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	self.pathFile = [documentsDirectory stringByAppendingPathComponent:self.fileName];
}

@end
