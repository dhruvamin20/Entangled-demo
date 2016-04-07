//
//  PropertyEditTableViewController.h
//  Entangled
//
//  Created by Dhruv Amin on 2016-04-06.
//  Copyright © 2016 Spartans. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Property;
@protocol AddNewProperty <NSObject>

-(void)addWithTitle:(NSString*)title detailText:(NSString*)detail timeStamp:(NSDate *)timeStamp buildingValue:(NSDecimalNumber*)value;

@end

@interface PropertyEditTableViewController : UITableViewController <UITextFieldDelegate>

// @property (strong, nonatomic) Property *property;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextView *noteTextView;
@property (weak, nonatomic) IBOutlet UILabel *timeStampLabel;
@property (weak, nonatomic) IBOutlet UITextView *locationTextView;
@property (weak, nonatomic) IBOutlet UITextField *buildingValueTextField;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveBarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *emailBarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *reminderBarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *airDropBarButton;

@property (weak, nonatomic) id <AddNewProperty>delegate;
@property (nonatomic) NSManagedObjectContext *managedObjectContext;


@end
