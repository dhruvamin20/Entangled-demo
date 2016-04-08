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
#import "Items.h"


@interface PropertyEditTableViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic) NSDate *timeStamp;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextView *descr;
@property (weak, nonatomic) IBOutlet UITextField *value;
@property (weak, nonatomic) IBOutlet UITextField *quantityItem;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *timeStampLabel;


@end

@implementation PropertyEditTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timeStamp = [NSDate date];
    [self configureView];
}
- (IBAction)save:(UIBarButtonItem *)sender {
    [self insertNewObject];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)cameraTapped:(UIBarButtonItem *)sender {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        return;
    }
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.delegate = self;
    NSArray *sourceTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    NSLog(@"%@", sourceTypes);
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    ipc.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:
                      UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:ipc animated:YES completion:nil];
    
}
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    NSLog(@"%@", info);
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.imageView.image = image;
    [self dismissViewControllerAnimated:YES completion:^ {
        
    }];
}

-(void)insertNewObject {
    
    Items *item = [NSEntityDescription insertNewObjectForEntityForName:@"Items" inManagedObjectContext:self.managedObjectContext];
    
    item.itemName = self.name.text;
    item.itemDescription = self.descr.text;
    NSDecimalNumber *dn = [[NSDecimalNumber alloc] initWithString:self.value.text];
    item.itemValue = dn;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    
    item.timeStamp = self.timeStamp;
    
    NSData *data = UIImagePNGRepresentation(self.imageView.image);
    item.itemImage = data;
    item.quantity = self.quantityItem.text.intValue;
    
    
    //    newProperty.timeStamp = self.timeStamp;
    //    newProperty.propertyName = self.nameTextField.text;
    //    newProperty.notes = self.noteTextView.text;
    //    NSDecimalNumber *dn = [[NSDecimalNumber alloc] initWithString:self.buildingValueTextField.text];
    //    newProperty.buildingValue = dn;
    
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
    
    self.descr.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.descr.layer.borderWidth = 0.3;
    self.descr.layer.cornerRadius = 5;
    self.descr.clipsToBounds = YES;
    //  NSLog(@"===>>>> %@", self.property.timeStamp);
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    self.timeStampLabel.text = [dateFormatter stringFromDate:self.timeStamp];
    
}




@end
