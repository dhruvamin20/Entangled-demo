//
//  PropertyEditViewController.h
//  Entangled
//
//  Created by Dhruv Amin on 2016-04-06.
//  Copyright © 2016 Spartans. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Property;

@protocol AddNewProperty <NSObject>

-(void)addNewName:(NSString*)propertName buildingValue:(NSNumber*)value;

@end

@interface PropertyEditViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *propertyNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UITextField *propertyValueTextField;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UITextView *addressTextView;
@property (nonatomic, weak) id <AddNewProperty>delegate;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end
