//
//  MenuObject.h
//  DataEntryApp
//
//  Created by Rana Hammad on 10/10/15.
//  Copyright (c) 2015 CreativeBugs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuObject : NSObject

@property (nonatomic, retain)   NSString    *name;
@property (nonatomic, retain)   NSString    *info;
@property (nonatomic, retain)   NSString    *imageName;
@property (nonatomic)           double      price;
@property (nonatomic)           int         quantity;

-(id) initWithMenuObject:(MenuObject *)theMenuObj;

@end
