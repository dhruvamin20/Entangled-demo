//
//  DetailViewController.h
//  Entangled
//
//  Created by Dhruv Amin on 2016-04-05.
//  Copyright © 2016 Spartans. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Property;

@interface PropertyViewController : UIViewController

@property (strong, nonatomic) Property *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

