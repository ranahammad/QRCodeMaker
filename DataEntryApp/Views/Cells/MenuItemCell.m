//
//  MenuItemCell.m
//  DataEntryApp
//
//  Created by Rana Hammad on 10/10/15.
//  Copyright (c) 2015 CreativeBugs. All rights reserved.
//

#import "MenuItemCell.h"

@interface MenuItemCell()
{
    MenuObject *theMenuObj;
}
@end

@implementation MenuItemCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) loadMenuObject:(MenuObject*)theMenu{
    theMenuObj = theMenu;
    [self populateCell:0];
}

- (void) loadOrderObject:(MenuObject*)theMenu{
    theMenuObj = theMenu;
    [self populateCell:1];
}

- (void) populateCell:(int)cellType{
    _menuTitle.text = theMenuObj.name;
    _menuPrice.text = [NSString stringWithFormat:@"MYR %.2f", (theMenuObj.quantity * theMenuObj.price)];
    _menuThumbnail.image = [UIImage imageNamed:theMenuObj.imageName];
    
    if (cellType == 0) {
        _menuQty.text   = [NSString stringWithFormat:@"%d", theMenuObj.quantity];
    }
    else if (cellType == 1){
        _menuQty.text   = [NSString stringWithFormat:@"(%d units)", theMenuObj.quantity];
    }
}

- (void) resetAddButton{
    _addButton.selected = NO;
}

- (IBAction)addMenuClicked:(id)sender {
    _addButton.selected = YES;
    if (_delegate) {
        if ([_delegate respondsToSelector:@selector(addMenuToList:)]) {
            [_delegate addMenuToList:theMenuObj];
        }
    }
    
    [self performSelector:@selector(resetAddButton) withObject:nil afterDelay:0.1];
}

- (IBAction)changeQty:(id)sender {
    theMenuObj.quantity = _qtyStepper.value;
    [self populateCell:0];
}

- (IBAction)removeMenuClicked:(id)sender{
    _addButton.selected = YES;
    if (_delegate) {
        if ([_delegate respondsToSelector:@selector(removeMenuFromList:)]) {
            [_delegate removeMenuFromList:theMenuObj];
        }
    }
    
    [self performSelector:@selector(resetAddButton) withObject:nil afterDelay:0.1];
}
@end
