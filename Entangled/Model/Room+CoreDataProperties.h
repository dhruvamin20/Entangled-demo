//
//  Room+CoreDataProperties.h
//  Entangled
//
//  Created by Dhruv Amin on 2016-04-05.
//  Copyright © 2016 Spartans. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Room.h"

NS_ASSUME_NONNULL_BEGIN

@interface Room (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSData *roomImage;
@property (nullable, nonatomic, retain) NSDecimalNumber *roomValue;
@property (nullable, nonatomic, retain) NSSet<Items *> *items;
@property (nullable, nonatomic, retain) Property *property;

@end

@interface Room (CoreDataGeneratedAccessors)

- (void)addItemsObject:(Items *)value;
- (void)removeItemsObject:(Items *)value;
- (void)addItems:(NSSet<Items *> *)values;
- (void)removeItems:(NSSet<Items *> *)values;

@end

NS_ASSUME_NONNULL_END
