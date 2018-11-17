//
//  ViewController.h
//  remont3
//
//  Created by Mac on 19.10.16.
//  Copyright © 2016 StanislavAdvanc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ViewController : UIViewController<MFMailComposeViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UILabel *blockLabel;
@property (weak, nonatomic) IBOutlet UILabel *notificationLabel;

@property (weak, nonatomic) IBOutlet UIWebView *myBrowser;
@property (weak, nonatomic) IBOutlet UIWebView *myBrowser2;
@property (weak, nonatomic) IBOutlet UIWebView *myBrowser3;
@property (weak, nonatomic) IBOutlet UIWebView *myBrowser4;


@property (weak, nonatomic) IBOutlet UIButton *remontsafari;

@property (weak, nonatomic) IBOutlet UIButton *remontsafari1;


- (IBAction)createEmail;






@end

