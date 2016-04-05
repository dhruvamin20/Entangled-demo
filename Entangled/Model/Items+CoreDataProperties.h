//
//  Items+CoreDataProperties.h
//  Entangled
//
//  Created by Dhruv Amin on 2016-04-05.
//  Copyright © 2016 Spartans. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Items.h"

NS_ASSUME_NONNULL_BEGIN

@interface Items (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *itemDescription;
@property (nullable, nonatomic, retain) NSData *itemImage;
@property (nullable, nonatomic, retain) NSDecimalNumber *itemValue;
@property (nonatomic) NSTimeInterval purchaseDate;
@property (nonatomic) int16_t quantity;
@property (nullable, nonatomic, retain) NSData *receiptImage;
@property (nullable, nonatomic, retain) Room *roomItems;

@end

NS_ASSUME_NONNULL_END
