//
//  MenuItemCell.h
//  DataEntryApp
//
//  Created by Rana Hammad on 10/10/15.
//  Copyright (c) 2015 CreativeBugs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuObject.h"

@protocol MenuItemCellDelegate <NSObject>
@optional
- (void) addMenuToList:(MenuObject *)theMenu;
- (void) removeMenuFromList:(MenuObject *)theMenu;
@end

@interface MenuItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *menuThumbnail;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UILabel *menuTitle;
@property (weak, nonatomic) IBOutlet UILabel *menuQty;
@property (weak, nonatomic) IBOutlet UILabel *menuPrice;
@property (weak, nonatomic) IBOutlet UIStepper *qtyStepper;
@property (nonatomic, assign) id<MenuItemCellDelegate> delegate;

- (void) loadMenuObject:(MenuObject*)theMenu;
- (void) loadOrderObject:(MenuObject*)theMenu;

- (IBAction)addMenuClicked:(id)sender;
- (IBAction)changeQty:(id)sender;
- (IBAction)removeMenuClicked:(id)sender;
@end
