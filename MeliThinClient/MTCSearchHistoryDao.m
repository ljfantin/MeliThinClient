//
//  MTCSearchHistorialDao.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 13/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCSearchHistoryDao.h"
#import "MTCSearchHistoryDto.h"

@implementation MTCSearchHistoryDao

-(NSArray*) getAll{
    NSMutableArray * queryHistorial = [[NSMutableArray alloc] init];
    [queryHistorial addObject:[MTCSearchHistoryDto initWith:@"Peugeot" data:@"01/01/2014"]];
    [queryHistorial addObject:[MTCSearchHistoryDto initWith:@"Fiat" data:@"01/01/2014"]];
    [queryHistorial addObject:[MTCSearchHistoryDto initWith:@"Renault" data:@"01/01/2014"]];
    return queryHistorial;
}
@end
