//
//  RoomTableViewController.h
//  Entangled
//
//  Created by Dhruv Amin on 2016-04-07.
//  Copyright © 2016 Spartans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Property.h"


@interface RoomTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic) Property *property;
@property (strong, nonatomic) NSFetchedResultsController* fetchedResultsController;

@end
