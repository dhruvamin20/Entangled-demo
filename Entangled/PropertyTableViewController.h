//
//  MasterViewController.h
//  Entangled
//
//  Created by Dhruv Amin on 2016-04-05.
//  Copyright © 2016 Spartans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <CoreLocation/CoreLocation.h>

@class PropertyViewController;

@interface PropertyTableViewController : UITableViewController <NSFetchedResultsControllerDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) PropertyViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

