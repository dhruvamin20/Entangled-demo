//
//  PropertyTableViewCell.m
//  Entangled
//
//  Created by Dhruv Amin on 2016-04-06.
//  Copyright © 2016 Spartans. All rights reserved.
//

#import "PropertyTableViewCell.h"
#import "Items.h"

@interface PropertyTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *descrLabel;
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;

@end

@implementation PropertyTableViewCell


-(void)setItem:(Items *)item {
    _item = item;
    self.nameLabel.text = _item.itemName;
    self.descrLabel.text = _item.itemDescription;
    UIImage *image = [UIImage imageWithData:_item.itemImage];
    self.itemImageView.image = image;
}

@end
