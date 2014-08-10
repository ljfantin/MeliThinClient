//
//  MTCPriceFavoriteButtonVipItemViewItemTableViewCell.m
//  MeliThinClient
//
//  Created by Leandro Fantin on 09/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "MTCPriceFavoriteButtonVipItemViewItemTableViewCell.h"

@implementation MTCPriceFavoriteButtonVipItemViewItemTableViewCell


- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MTCPriceFavoriteButtonVipItemViewItemTableViewCell" owner:self options:nil];
        self = [nib objectAtIndex:0];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    // ignore the style argument, use our own to override
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MTCPriceFavoriteButtonVipItemViewItemTableViewCell" owner:self options:nil];
        self = [nib objectAtIndex:0];
    }
    return self;
}


- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_buttonFavorite release];
    [_labelPrice release];
    [super dealloc];
}
@end
