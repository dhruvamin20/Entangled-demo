//
//  DetailViewController.m
//  Entangled
//
//  Created by Dhruv Amin on 2016-04-05.
//  Copyright © 2016 Spartans. All rights reserved.
//

#import "PropertyViewController.h"
#import "PropertyEditTableViewController.h"
#import "Items.h"

@interface PropertyViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *savedImage;
@property (weak, nonatomic) IBOutlet UILabel *nameOfItem;
@property (weak, nonatomic) IBOutlet UILabel *descrOfItem;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueOfItem;
@property (weak, nonatomic) IBOutlet UILabel *quantityOfItem;


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
        self.nameOfItem.text = self.detailItem.itemName;
        self.descrOfItem.text = self.detailItem.itemDescription;
        
        self.valueOfItem.text = self.detailItem.itemValue.stringValue;
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
        self.timeLabel.text = [dateFormatter stringFromDate:self.detailItem.timeStamp];
        self.quantityOfItem.text = [NSString stringWithFormat:@"%d", self.detailItem.quantity];
        self.savedImage.image = [UIImage imageWithData:self.detailItem.itemImage];
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
