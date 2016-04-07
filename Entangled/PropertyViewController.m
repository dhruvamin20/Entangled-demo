//
//  DetailViewController.m
//  Entangled
//
//  Created by Dhruv Amin on 2016-04-05.
//  Copyright © 2016 Spartans. All rights reserved.
//

#import "PropertyViewController.h"
#import "PropertyEditTableViewController.h"
#import "Property.h"

@interface PropertyViewController ()

@end

@implementation PropertyViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.propertyNameLabel.text = self.detailItem.propertyName;
        self.textViewNote.text = self.detailItem.notes;
        
        NSNumberFormatter *decimalFormatter = [[NSNumberFormatter alloc] init];
        decimalFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        decimalFormatter.minimumFractionDigits = 2;
        decimalFormatter.maximumFractionDigits = 2;
        self.buildingValueLabel.text = [decimalFormatter stringFromNumber:self.detailItem.buildingValue];
       
        self.locationView.text = self.detailItem.fullAddress;
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
        self.timeLabel.text = [dateFormatter stringFromDate:self.detailItem.timeStamp];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
