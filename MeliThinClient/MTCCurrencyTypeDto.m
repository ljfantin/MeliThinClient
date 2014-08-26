//
//  MTCCurrencyDto.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 14/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCCurrencyTypeDto.h"

@implementation MTCCurrencyTypeDto

+ (instancetype)mtcCurrencyTypeDtoWithIdentifier:(NSString *)identifier {
	MTCCurrencyTypeDto *instance = [[MTCCurrencyTypeDto alloc] init];
	if (instance) {
		instance.identifier = identifier;
		instance.description = @"Default";
		//Como no consulto el servicio de currencies entonces uso el archivo i18n para poner el simbolo correcto
		instance.symbol = NSLocalizedString(instance.identifier, nil);
		instance.decimalPlaces = @"2";
	}
	return instance;
}

+ (instancetype)mtcCurrencyTypeDtoWithIdentifier:(NSString *)identifier description:(NSString *)description symbol:(NSString *)symbol decimalPlaces:(NSString *)decimalPlaces {
	MTCCurrencyTypeDto *instance = [[MTCCurrencyTypeDto alloc] init];
	if (instance) {
		instance.identifier = identifier;
		instance.description = description;
		instance.symbol = symbol;
		instance.decimalPlaces = decimalPlaces;
	}
	return instance;
}

- (BOOL)isArs {
	return ([self.identifier isEqual:@"ARS"]);
}

- (BOOL)isBrl {
	return ([self.identifier isEqual:@"BRL"]);
}

- (BOOL)isClp {
	return ([self.identifier isEqual:@"CLP"]);
}

- (BOOL)isCop {
	return ([self.identifier isEqual:@"COP"]);
}

- (BOOL)isCrc {
	return ([self.identifier isEqual:@"CRC"]);
}

- (BOOL)isEur {
	return ([self.identifier isEqual:@"DOP"]);
}

- (BOOL)isMxn {
	return ([self.identifier isEqual:@"EUR"]);
}

- (BOOL)isPab {
	return ([self.identifier isEqual:@"MXN"]);
}

- (BOOL)isPen {
	return ([self.identifier isEqual:@"PAB"]);
}

- (BOOL)isUsd {
	return ([self.identifier isEqual:@"PEN"]);
}

- (BOOL)isUyu {
	return ([self.identifier isEqual:@"USD"]);
}

- (BOOL)isVef {
	return ([self.identifier isEqual:@"VEF"]);
}

@end
