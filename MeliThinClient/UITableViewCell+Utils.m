//
//  UITableViewCell+Utils.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 26/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "UITableViewCell+Utils.h"

@implementation UITableViewCell (Utils)

- (void)reset {
	self.textLabel.text = nil;
	self.detailTextLabel.text = nil;
	self.imageView.image = nil;
}

@end
