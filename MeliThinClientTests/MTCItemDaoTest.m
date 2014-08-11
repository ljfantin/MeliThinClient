//
//  MTCItemDaoTest.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 11/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MTCItemDao.h"
#import "MTCItemDto.h"
#import "MTCPictureDto.h"

@interface MTCItemDaoTest : XCTestCase

@property MTCItemDao * dao;

@end

@implementation MTCItemDaoTest

- (void)setUp
{
    [super setUp];
    _dao = [[MTCItemDao alloc] init];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testExample
{
    MTCItemDto * dto = [[MTCItemDto alloc] init];
    dto.id = @"1";
    dto.title = @"titulo 1";
    dto.subtitle = @"subtitulo";
    dto.price = [NSNumber numberWithInt:100];
    dto.availableQuantity = [NSNumber numberWithInt:10];
    
    MTCPictureDto * pic1= [[MTCPictureDto alloc] init];
    pic1.id = @"pic1";
    pic1.url = @"http://sarasa.png";
    
    MTCPictureDto * pic2 = [[MTCPictureDto alloc] init];
    pic2.id = @"pic2";
    pic2.url = @"http://sarasa.png";
    NSArray * pictures = @[pic1,pic2];
    dto.pictures = pictures;
    
    [_dao save:dto];
    NSEnumerator * items = [_dao findAll];
    MTCItemDto * dtoSaved = nil;
    while ((dtoSaved = [items nextObject])) {
        NSLog(@"%@", dtoSaved);
    }
}

@end
