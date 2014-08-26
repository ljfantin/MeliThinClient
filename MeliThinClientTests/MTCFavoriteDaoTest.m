//
//  MTCItemDaoTest.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 11/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MTCFavoriteManager.h"

@interface MTCFavoriteDaoTest : XCTestCase

@end

@implementation MTCFavoriteDaoTest

- (void)setUp {
	[super setUp];
}

- (void)tearDown {
	[super tearDown];
}

- (void)testExample {
	/*[[MTCFavoriteManager sharedInstance] commit];

	   [[MTCFavoriteManager sharedInstance] saveFavoriteIdentifier:@"1"];
	   [[MTCFavoriteManager sharedInstance] saveFavoriteIdentifier:@"2"];
	   [[MTCFavoriteManager sharedInstance] commit];
	   NSArray *idsSaved = [[MTCFavoriteManager sharedInstance] getAll];
	   XCTAssertEqual([idsSaved count], 2, @"No es la misma longitud");
	   XCTAssertEqualObjects(idsSaved[0], @"1", @"No es el mismo id");
	   XCTAssertEqualObjects(idsSaved[1], @"2", @"No es el mismo id");

	   [[MTCFavoriteManager sharedInstance] deleteFavoriteIdentifier:@"1"];
	   [[MTCFavoriteManager sharedInstance] commit];
	   idsSaved = [[MTCFavoriteManager sharedInstance] getAll];
	   XCTAssertEqual([idsSaved count], 1, @"No es la misma longitud");
	   XCTAssertEqualObjects(idsSaved[0], @"2", @"No es el mismo id");*/
}

@end
