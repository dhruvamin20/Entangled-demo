//
//  RoomSearchTableViewController.m
//  Entangled
//
//  Created by Dhruv Amin on 2016-04-07.
//  Copyright © 2016 Spartans. All rights reserved.
//

#import "RoomSearchTableViewController.h"

@interface RoomSearchTableViewController ()

@end

@implementation RoomSearchTableViewController

@synthesize roomSearchController;
@synthesize allRooms;
@synthesize displayedRooms;
@synthesize filteredRooms;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allRooms = [[NSMutableArray alloc] init];
    [self.allRooms addObject:@"Attic"];
    [self.allRooms addObject:@"Bar"];
    [self.allRooms addObject:@"Basement"];
    [self.allRooms addObject:@"Bathroom"];
    [self.allRooms addObject:@"Bedroom"];
    [self.allRooms addObject:@"Bedroom - Master"];
    [self.allRooms addObject:@"Bedroom 2"];
    [self.allRooms addObject:@"Cellar"];
    [self.allRooms addObject:@"Closet"];
    [self.allRooms addObject:@"Deck"];
    [self.allRooms addObject:@"Dining Room"];
    [self.allRooms addObject:@"Family Room"];
    [self.allRooms addObject:@"Foyer"];
    [self.allRooms addObject:@"Furnace Room"];
    [self.allRooms addObject:@"Garage"];
    [self.allRooms addObject:@"Gym"];
    [self.allRooms addObject:@"Kitchen"];
    [self.allRooms addObject:@"Laundry Room"];
    [self.allRooms addObject:@"Library"];
    [self.allRooms addObject:@"Living Room"];
    [self.allRooms addObject:@"Office"];
    [self.allRooms addObject:@"Patio"];
    [self.allRooms addObject:@"Play Room"];
    [self.allRooms addObject:@"Pool House"];
    [self.allRooms addObject:@"Shed"];
    [self.allRooms addObject:@"Storage Room"];
    [self.allRooms addObject:@"TV Room"];
    [self.allRooms addObject:@"Wine Cellar"];
    
    // Create a list to hold search results (filtered list)
    self.filteredRooms = [[NSMutableArray alloc] init];
    
    // Initially display the full list.  This variable will toggle between the full and the filtered lists.
    
    self.displayedRooms= self.allRooms;
    
    // Here's where we create our UISearchController
    
    self.roomSearchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.roomSearchController.searchResultsUpdater = self;
    self.roomSearchController.searchBar.delegate = self;
    
    [self.roomSearchController.searchBar sizeToFit];
    
    // Add the UISearchBar to the top header of the table view
    self.tableView.tableHeaderView = self.roomSearchController.searchBar;
    
    // Hides search bar initially.  When the user pulls down on the list, the search bar is revealed.
    [self.tableView setContentOffset:CGPointMake(0, self.roomSearchController.searchBar.frame.size.height)];
    

    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.displayedRooms count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"roomSearchCell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];
    }
    cell.textLabel.text = [self.displayedRooms objectAtIndex:indexPath.row];
    return cell;

    
    return cell;
}

// When the user types in the search bar, this method gets called.
- (void)updateSearchResultsForSearchController:(UISearchController *)aSearchController {
    NSLog(@"updateSearchResultsForSearchController");
    
    NSString *searchString = roomSearchController.searchBar.text;
    NSLog(@"searchString=%@", searchString);
    
    // Check if the user cancelled or deleted the search term so we can display the full list instead.
    if (![searchString isEqualToString:@""]) {
        [self.filteredRooms removeAllObjects];
        for (NSString *str in self.allRooms) {
            if ([searchString isEqualToString:@""] || [str localizedCaseInsensitiveContainsString:searchString] == YES) {
                NSLog(@"str=%@", str);
                [self.filteredRooms addObject:str];
            }
        }
        self.displayedRooms = self.filteredRooms;
    }
    else {
        self.displayedRooms = self.allRooms;
    }
    [self.tableView reloadData];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
