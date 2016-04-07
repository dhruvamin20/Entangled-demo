//
//  PropertyEditTableViewController.m
//  Entangled
//
//  Created by Dhruv Amin on 2016-04-06.
//  Copyright © 2016 Spartans. All rights reserved.
//

#import "PropertyEditTableViewController.h"
#import <MessageUI/MessageUI.h>
#import "AppDelegate.h"
#import "Property.h"
#import "Room.h"


@interface PropertyEditTableViewController ()
@property (nonatomic) NSDate *timeStamp;
@end

@implementation PropertyEditTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timeStamp = [NSDate date];
    [self configureView];
    
    
    
    UITapGestureRecognizer *backgroundTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handlebackgroundTap:)];
    [self.view addGestureRecognizer:backgroundTap];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
//
//- (void)setProperty:(id)newProperty {
//    
//    if (_property != newProperty) {
//        _property = newProperty;
//        
//        // Update the view.
//        [self configureView];
//    }
//}
-(void)insertNewObject {
       Property *newProperty = [NSEntityDescription insertNewObjectForEntityForName:@"Property" inManagedObjectContext:self.managedObjectContext];

    newProperty.timeStamp = self.timeStamp;
    newProperty.propertyName = self.nameTextField.text;
    newProperty.notes = self.noteTextView.text;
    NSDecimalNumber *dn = [[NSDecimalNumber alloc] initWithString:self.buildingValueTextField.text];
    newProperty.buildingValue = dn;
    
//    newProperty.locationLatitude = [NSNumber numberWithDouble:self.propertyLocation.coordinate.latitude];
//    newProperty.locationLongitude = [NSNumber numberWithDouble:self.propertyLocation.coordinate.longitude];
//    NSLog(@"Property lat: %@ | lng: %@", newProperty.locationLatitude, newProperty.locationLongitude);
//
//    newProperty.fullAddress = self.propertyAddress;
//    NSLog(@"Property address : %@", newProperty.fullAddress);


// Save the context.
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    abort();

    }
}
-(void)configureView {
    
    self.noteTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.noteTextView.layer.borderWidth = 0.3;
    self.noteTextView.layer.cornerRadius = 5;
    self.noteTextView.clipsToBounds = YES;
   //  NSLog(@"===>>>> %@", self.property.timeStamp);
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    self.timeStampLabel.text = [dateFormatter stringFromDate:self.timeStamp];
    
    self.locationTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.locationTextView.layer.borderWidth = 0.3;
    self.locationTextView.layer.cornerRadius = 5;
    self.locationTextView.clipsToBounds = YES;

    // get the user's location here
    self.locationTextView.text = @"Dummy address";
    

}

- (void)handlebackgroundTap:(UITapGestureRecognizer *)sender {
    
    [self.view endEditing:YES];
}

- (IBAction)saveBarButton:(id)sender {
//    [self.view endEditing:YES];
//    
//    NSString *title = self.nameTextField.text;
//    NSString *detail = self.noteTextView.text;
    
//    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//    [dateFormat setDateFormat:@"yyyyMMdd"];
//    NSDate *date = [dateFormat dateFromString:self.timeStampLabel.text];
//    
//    NSNumberFormatter *decimalFormatter = [[NSNumberFormatter alloc] init];
//    decimalFormatter.numberStyle = NSNumberFormatterDecimalStyle;
//    decimalFormatter.minimumFractionDigits = 2;
//    decimalFormatter.maximumFractionDigits = 2;
//    self.property.buildingValue = [NSDecimalNumber decimalNumberWithDecimal:[decimalFormatter numberFromString:self.buildingValueTextField.text].decimalValue];
//    NSDecimalNumber *value = self.property.buildingValue;
//    self.property.fullAddress = self.locationTextView.text;
    
    // [self.delegate addWithTitle:title detailText:detail timeStamp:date buildingValue:value];
    [self insertNewObject];
    [self.navigationController popToRootViewControllerAnimated:YES];
}



@end
