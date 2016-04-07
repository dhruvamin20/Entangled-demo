//
//  RoomTableViewCell.h
//  Entangled
//
//  Created by Dhruv Amin on 2016-04-07.
//  Copyright © 2016 Spartans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *roomImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end
