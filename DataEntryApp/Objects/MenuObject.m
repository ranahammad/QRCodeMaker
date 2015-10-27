//
//  MenuObject.m
//  DataEntryApp
//
//  Created by Rana Hammad on 10/10/15.
//  Copyright (c) 2015 CreativeBugs. All rights reserved.
//

#import "MenuObject.h"

@implementation MenuObject


-(id) initWithMenuObject:(MenuObject *)theMenuObj{

    if (self = [super init]) {
        _name = theMenuObj.name;
        _info = theMenuObj.info;
        _imageName = theMenuObj.imageName;
        _price = theMenuObj.price;
        _quantity = theMenuObj.quantity;
    }

    return self;
}

@end
