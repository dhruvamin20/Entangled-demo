//
//  PropertyTableViewCell.h
//  Entangled
//
//  Created by Dhruv Amin on 2016-04-06.
//  Copyright © 2016 Spartans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PropertyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end
