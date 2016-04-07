//
//  RoomEditTableViewController.h
//  Entangled
//
//  Created by Dhruv Amin on 2016-04-07.
//  Copyright © 2016 Spartans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Room.h"
@protocol AddNewRoom <NSObject>

-(void)addWithName:(NSString*)name value:(int)value imageView:(UIImage*)image;

@end


@interface RoomEditTableViewController : UITableViewController

@property (nonatomic) Room *room;

@end
