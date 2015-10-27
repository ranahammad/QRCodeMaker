//
//  ReceiptView.h
//  DataEntryApp
//
//  Created by Rana Hammad on 10/10/15.
//  Copyright (c) 2015 CreativeBugs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReceiptView : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *qrImageView;
- (IBAction)saveQRCode:(id)sender;
- (IBAction)doneClicked:(id)sender;
@end
