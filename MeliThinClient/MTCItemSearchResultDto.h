//
//  MTCItemDto.h
//  MeliThinClient
//
//  Created by Leandro Fantin on 06/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCConditiontTypeDto.h"
#import "MTCBuyingModeTypeDto.h"

@interface MTCItemSearchResultDto : NSObject



@property (nonatomic,retain) NSString * id;
@property (nonatomic,retain) NSString * tittle;
@property (nonatomic,retain) NSNumber * price;
@property (nonatomic,retain) NSString * subtitle;
@property (nonatomic,retain) NSNumber * availableQuantity;
@property (nonatomic,retain) UIImage * thumbnail;

@property (nonatomic,retain) MTCBuyingModeTypeDto * buyingMode;
@property (nonatomic,retain) MTCConditiontTypeDto * condition;


+(instancetype) initWithId:(NSString*)id title:(NSString *) title price:(NSNumber*) price subtitle:(NSString*) subtitle  availableQuantity:(NSNumber*)quantity condition:(MTCConditiontTypeDto*)condition buyingMode:(MTCBuyingModeTypeDto*)buyingMode thumbnail:(UIImage*) image;

@end
