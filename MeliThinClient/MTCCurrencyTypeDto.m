//
//  MTCCurrencyDto.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 14/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCCurrencyTypeDto.h"

@implementation MTCCurrencyTypeDto

+ (instancetype) mtcCurrencyTypeDtoWithIdentifier:(NSString*)id
{
    MTCCurrencyTypeDto * instance = [[[MTCCurrencyTypeDto alloc] init] autorelease];
    if (self) {
        instance.id = id;
        instance.description = @"Default";
        //Como no consulto el servicio de currencies entonces uso el archivo i18n para poner el simbolo correcto
        instance.symbol = NSLocalizedString(instance.id, nil);
        instance.decimalPlaces = @"2";
    }
    return instance;
}

+ (instancetype) mtcCurrencyTypeDtoWithIdentifier:(NSString*)id description:(NSString*)description symbol:(NSString*)symbol decimalPlaces:(NSString*)decimalPlaces
{
    MTCCurrencyTypeDto * instance = [[MTCCurrencyTypeDto alloc] init];
    if (self) {
        instance.id = id;
        instance.description = description;
        instance.symbol = symbol;
        instance.decimalPlaces = decimalPlaces;
    }
    return instance;
}

- (BOOL) isArs
{
    return ([self.id isEqual:@"ARS"]);
}

- (BOOL) isBrl
{
    return ([self.id isEqual:@"BRL"]);

}

- (BOOL) isClp
{
    return ([self.id isEqual:@"CLP"]);

}

- (BOOL) isCop
{
    return ([self.id isEqual:@"COP"]);

}
- (BOOL) isCrc
{
    return ([self.id isEqual:@"CRC"]);
}
- (BOOL) isEur
{
    return ([self.id isEqual:@"DOP"]);

}
- (BOOL) isMxn
{
    return ([self.id isEqual:@"EUR"]);

}
- (BOOL) isPab
{
    return ([self.id isEqual:@"MXN"]);

}
- (BOOL) isPen
{
    return ([self.id isEqual:@"PAB"]);

}
- (BOOL) isUsd
{
    return ([self.id isEqual:@"PEN"]);

}
- (BOOL) isUyu
{
    return ([self.id isEqual:@"USD"]);

}
- (BOOL) isVef
{
    return ([self.id isEqual:@"VEF"]);

}

- (void)dealloc
{
    [_id release];
    _id = nil;
    [_decimalPlaces release];
    _decimalPlaces = nil;
    [_description release];
    _description = nil;
    [_symbol release];
    _symbol = nil;
    [super dealloc];
}

@end
