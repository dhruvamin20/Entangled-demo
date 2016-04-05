//
//  Property+CoreDataProperties.h
//  Entangled
//
//  Created by Dhruv Amin on 2016-04-05.
//  Copyright © 2016 Spartans. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Property.h"

NS_ASSUME_NONNULL_BEGIN

@interface Property (CoreDataProperties)

@property (nonatomic) NSDate *timeStamp;
@property (nullable, nonatomic, retain) NSString *propertyName;
@property (nullable, nonatomic, retain) NSDecimalNumber *buildingValue;
@property (nullable, nonatomic, retain) NSDecimalNumber *currency;
@property (nullable, nonatomic, retain) NSString *fullAddress;
@property (nullable, nonatomic, retain) NSSet<Room *> *rooms;

@end

@interface Property (CoreDataGeneratedAccessors)

- (void)addRoomsObject:(Room *)value;
- (void)removeRoomsObject:(Room *)value;
- (void)addRooms:(NSSet<Room *> *)values;
- (void)removeRooms:(NSSet<Room *> *)values;

@end

NS_ASSUME_NONNULL_END
