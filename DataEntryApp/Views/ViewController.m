//
//  ViewController.m
//  DataEntryApp
//
//  Created by Rana Hammad on 10/5/15.
//  Copyright (c) 2015 CreativeBugs. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

/*
 1. Register customer via email or wechat integration
 2. Once registered, create customer QR and save in DB
 
*/



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signInClicked:(id)sender {
}

- (IBAction)signUpWithFacebookClicked:(id)sender {
}

- (IBAction)signUpWithEmailClicked:(id)sender {
}

- (IBAction)signUpWithWeChatClicked:(id)sender {
    
    // perform login using weChat credentials
    [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"MenuView"] animated:YES completion:nil];
    
//    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
//    req.text = @"Connecting to weChat via QRCodeMaker!";
//    req.bText = YES;
//    req.scene = WXSceneSession;
//    [WXApi sendReq:req];
}
@end
