//
//  MTCItemDaoTest.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 11/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MTCFavoriteDaoImpl.h"

@interface MTCFavoriteDaoTest : XCTestCase

@end

@implementation MTCFavoriteDaoTest

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testExample
{
    [[MTCFavoriteDaoImpl sharedInstance] deleteAll];
    [[MTCFavoriteDaoImpl sharedInstance] commit];

    [[MTCFavoriteDaoImpl sharedInstance] save:@"1"];
    [[MTCFavoriteDaoImpl sharedInstance] save:@"2"];
    [[MTCFavoriteDaoImpl sharedInstance] commit];
    NSArray * idsSaved = [[MTCFavoriteDaoImpl sharedInstance] getAll];
    XCTAssertEqual([idsSaved count], 2, @"No es la misma longitud");
    XCTAssertEqualObjects(idsSaved[0], @"1", @"No es el mismo id");
    XCTAssertEqualObjects(idsSaved[1], @"2", @"No es el mismo id");
    
    [[MTCFavoriteDaoImpl sharedInstance] delete:@"1"];
    [[MTCFavoriteDaoImpl sharedInstance] commit];
    idsSaved = [[MTCFavoriteDaoImpl sharedInstance] getAll];
    XCTAssertEqual([idsSaved count], 1, @"No es la misma longitud");
    XCTAssertEqualObjects(idsSaved[0], @"2", @"No es el mismo id");
}

@end
