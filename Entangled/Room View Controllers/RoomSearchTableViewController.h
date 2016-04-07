//
//  RoomSearchTableViewController.h
//  Entangled
//
//  Created by Dhruv Amin on 2016-04-07.
//  Copyright © 2016 Spartans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoomSearchTableViewController : UITableViewController <UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating>

@property (nonatomic, strong) UISearchController * roomSearchController;
@property (nonatomic, strong) NSMutableArray * allRooms;
@property (nonatomic, strong) NSMutableArray * filteredRooms;
@property (nonatomic, weak) NSArray * displayedRooms;

@end
