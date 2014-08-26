//
//  UIImage+Utils.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 07/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "UIImage+Utils.h"

@implementation UIImage (Utils)

+ (UIImage *)imageWithUrl:(NSString *)url {
	NSURL *urlImage = [NSURL URLWithString:url];
	NSData *data = [NSData dataWithContentsOfURL:urlImage];
	UIImage *img = [[UIImage alloc] initWithData:data];
	return img;
}

@end
