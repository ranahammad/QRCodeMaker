//
//  MenuOrder.h
//  DataEntryApp
//
//  Created by Rana Hammad on 10/10/15.
//  Copyright (c) 2015 CreativeBugs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuObject.h"

@interface MenuOrder : NSObject

@property (nonatomic, retain)   NSMutableArray *menuItems;
@property (nonatomic, retain)   NSDate *menuDateTime;
@property (nonatomic)           double totalPrice;

+ (NSMutableArray *) loadMenuItems;

@end
