//
//  MenuOrder.m
//  DataEntryApp
//
//  Created by Rana Hammad on 10/10/15.
//  Copyright (c) 2015 CreativeBugs. All rights reserved.
//

#import "MenuOrder.h"

@implementation MenuOrder

- (id) init{
    self = [super init];
    if (self) {
        _menuItems = [NSMutableArray array];
        _menuDateTime = [NSDate date];
    }
    return self;
}

- (void) dealloc{
    
    _menuDateTime = nil;
    [_menuItems removeAllObjects];
    _menuItems = nil;
}

+ (NSMutableArray *) loadMenuItems{
    NSMutableArray *menu = [NSMutableArray new];
    
//    burger
//    chips
//    coffee
//    fish
//    fishnchips
//    juice
//    qrcodemaker
//    tea
    
    MenuObject *obj = [MenuObject new];
    obj.name = @"Burger";
    obj.imageName = @"burger.png";
    obj.price = 4.5;
    obj.quantity = 1;
    [menu addObject:obj];
    
    obj = [MenuObject new];
    obj.name = @"Chips";
    obj.imageName = @"chips.png";
    obj.price = 3;
    obj.quantity = 1;
    [menu addObject:obj];
    
    obj = [MenuObject new];
    obj.name = @"Fish";
    obj.imageName = @"fish.png";
    obj.price = 7;
    obj.quantity = 1;
    [menu addObject:obj];
    
    obj = [MenuObject new];
    obj.name = @"Fish n Chips";
    obj.imageName = @"fishnchips.png";
    obj.price = 9;
    obj.quantity = 1;
    [menu addObject:obj];
    
    obj = [MenuObject new];
    obj.name = @"Juice";
    obj.imageName = @"juice.png";
    obj.price = 3;
    obj.quantity = 1;
    [menu addObject:obj];
    
    obj = [MenuObject new];
    obj.name = @"Tea";
    obj.imageName = @"tea.png";
    obj.price = 1.8;
    obj.quantity = 1;
    [menu addObject:obj];
    
    obj = [MenuObject new];
    obj.name = @"Coffee";
    obj.imageName = @"coffee.png";
    obj.price = 2.4;
    obj.quantity = 1;
    [menu addObject:obj];
    
    
    return menu;
}

@end
