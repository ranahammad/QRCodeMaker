//
//  OrderView.m
//  DataEntryApp
//
//  Created by Rana Hammad on 10/10/15.
//  Copyright (c) 2015 CreativeBugs. All rights reserved.
//

#import "OrderView.h"
#import "MenuOrder.h"
#import "MenuItemCell.h"
#import "AppDelegate.h"

@interface OrderView ()<MenuItemCellDelegate>
@property (nonatomic, strong) NSMutableArray *menuItems;

@end

@implementation OrderView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AppDelegate *theApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _menuItems = theApp.theSavedItems;
    [_orderList reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuItems.count;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MenuItemCell *cell = (MenuItemCell *)[tableView dequeueReusableCellWithIdentifier:@"OrderItemCellID"];
    
    [cell loadOrderObject:self.menuItems[indexPath.row]];
    cell.delegate = self;
    
    return cell;
}

- (void) removeMenuFromList:(MenuObject *)theMenu{
    [_menuItems removeObject:theMenu];
    [_orderList reloadData];
}
@end
