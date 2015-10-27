//
//  ReceiptView.m
//  DataEntryApp
//
//  Created by Rana Hammad on 10/10/15.
//  Copyright (c) 2015 CreativeBugs. All rights reserved.
//

#import "ReceiptView.h"
#import "AppDelegate.h"
#import "MenuObject.h"

@interface ReceiptView () <UIImagePickerControllerDelegate>
{
    BOOL imageSaved;
}
@end

@implementation ReceiptView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    imageSaved = NO;
    
    NSArray *theMenu = [(AppDelegate *)[[UIApplication sharedApplication] delegate] theSavedItems];
    // get all order
    
    NSString *theFinalText = @"";
    double totalPrice = 0;
    
    for (MenuObject *theObj in theMenu) {
        
        double itemPrice = (theObj.quantity * theObj.price);
        if (theFinalText.length > 0)
            theFinalText = [theFinalText stringByAppendingString:@"\n"];
            
        theFinalText = [NSString stringWithFormat:@"%@Item = %@, Qty = %d, Price = %.2f",theFinalText,theObj.name, theObj.quantity, itemPrice];
        
        totalPrice += itemPrice;
    }
    
    theFinalText = [NSString stringWithFormat:@"%@\nTotal Price = %.2f", theFinalText, totalPrice];
    
    NSDateComponents *components = [[NSCalendar currentCalendar]
                                    components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute
                                    fromDate:[NSDate date]];
    
    theFinalText = [NSString stringWithFormat:@"%@\nQR Code valid until: %ld-%ld-%ld %ld:%ld",theFinalText,
                    (long)components.day,
                    (long)components.month,
                    (long)components.year,
                    (long)(components.hour+1),
                    (long)components.minute];
    
//    NSLog(@"thefinal text = \n%@",theFinalText);
    
    CIFilter *theFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    NSData *data = [theFinalText dataUsingEncoding:NSISOLatin1StringEncoding];
    [theFilter setValue:data forKey:@"inputMessage"];
    [theFilter setValue:@"Q" forKey:@"inputCorrectionLevel"];
    
    double scaleX = 288 / theFilter.outputImage.extent.size.width;
    double scaleY = 288 / theFilter.outputImage.extent.size.height;
    
    _qrImageView.image = [UIImage imageWithCIImage:[theFilter.outputImage imageByApplyingTransform:CGAffineTransformMakeScale(scaleX, scaleY)]];
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

- (void) savingComplete{
    [[[UIAlertView alloc] initWithTitle:@"QR Code Saved!" message:@"The QRCode for your order is saved in photo album." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    imageSaved = YES;
}

-(UIImage *)captureView:(UIView *)view
{
    CGRect screenRect = CGRectMake(0, 0, 288, 288);
    
    UIGraphicsBeginImageContext(screenRect.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor clearColor] set];
    CGContextFillRect(ctx, screenRect);
    
    [view.layer renderInContext:ctx];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage*) takeSnapshot
{
    return [self captureView:_qrImageView];
}

- (IBAction)saveQRCode:(id)sender {
    
    UIImage *pImage = [self takeSnapshot];
    UIImageWriteToSavedPhotosAlbum(pImage,
                                   self,
                                   @selector(imageSavedToPhotosAlbum:
                                             didFinishSavingWithError:
                                             contextInfo:), 
                                   nil);  	
    pImage = nil;
}

#pragma mark Image Saving methods

- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSString *message;
    NSString *title;
    if (!error)
    {
        imageSaved = YES;
        title = NSLocalizedString(@"QR Code Saved!", @"");
        message = NSLocalizedString(@"The QRCode for your order is saved in photo album.", @"");
    } else {
        title = NSLocalizedString(@"Saving Image", @"");
        message = [error description];
    }
    [[[UIAlertView alloc] initWithTitle:title
                                message:message
                               delegate:nil
                      cancelButtonTitle:NSLocalizedString(@"OK", @"")
                      otherButtonTitles:nil] show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


- (IBAction)doneClicked:(id)sender {
    if (imageSaved == NO) {
        [[[UIAlertView alloc] initWithTitle:@"Discarding order" message:@"Are you sure?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil] show];
    }
    else
        [self dismissViewControllerAnimated:YES completion:nil];
}

@end
