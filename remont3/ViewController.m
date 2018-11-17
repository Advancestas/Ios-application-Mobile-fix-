//
//  ViewController.m
//  remont3
//
//  Created by Mac on 19.10.16.
//  Copyright © 2016 StanislavAdvanc. All rights reserved.
//

#import "ViewController.h"

#import "Reachability.h"

@interface ViewController ()
-(void)reachabilityChanged:(NSNotification*)note;
@property(strong) Reachability * googleReach;
@end

@implementation ViewController
@synthesize myBrowser;
@synthesize myBrowser2;


- (void)viewDidUnload
{
    [super viewDidUnload];
    
   
    
    
    self.myBrowser = nil;
    
    self.myBrowser2 = nil;
    
    
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
    [_remontsafari1 addTarget:self action:@selector(someMethod) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.blockLabel.text = @"Not Fired Yet";
    self.notificationLabel.text = @"Not Fired Yet";
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    
    
    __weak __block typeof(self) weakself = self;
    
    //////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////
    //
    // create a Reachability object for www.google.com
    
    self.googleReach = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    self.googleReach.reachableBlock = ^(Reachability * reachability)
    {
        NSString * temp = [NSString stringWithFormat:@"", reachability.currentReachabilityString];
        NSLog(@"%@", temp);
        
        // to update UI components from a block callback
        // you need to dipatch this to the main thread
        // this uses NSOperationQueue mainQueue
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            weakself.blockLabel.text = temp;
            weakself.blockLabel.textColor = [UIColor blackColor];
        }];
    };
    
    self.googleReach.unreachableBlock = ^(Reachability * reachability)
    {
        NSString * temp = [NSString stringWithFormat:@"Включите, пожалуйста, интернет", reachability.currentReachabilityString];
        NSLog(@"%@", temp);
        
        // to update UI components from a block callback
        // you need to dipatch this to the main thread
        // this one uses dispatch_async they do the same thing (as above)
        dispatch_async(dispatch_get_main_queue(), ^{
            weakself.blockLabel.text = temp;
            weakself.blockLabel.textColor = [UIColor redColor];
        });
    };
    
    [self.googleReach startNotifier];
    
    NSURL *imaladecLink = [NSURL URLWithString:@"http://mobiltelefon.ru/"];
    [myBrowser loadRequest:[NSURLRequest requestWithURL:imaladecLink]];
    NSURL *imaladecLink2 = [NSURL URLWithString:@"https://yandex.by/maps/org/torgovy_tsentr_kupalovskiy/88685155363/"];
    NSURL *imaladecLink3 = [NSURL URLWithString:@"https://yandex.by/maps/157/minsk/?mode=search&ol=geo&ouri=ymapsbm1%3A%2F%2Fgeo%3Fll%3D27.539%252C53.905%26spn%3D0.001%252C0.001%26text%3D%25D0%2591%25D0%25B5%25D0%25BB%25D0%25B0%25D1%2580%25D1%2583%25D1%2581%25D1%258C%252C%2520%25D0%259C%25D0%25B8%25D0%25BD%25D1%2581%25D0%25BA%252C%2520%25D0%259A%25D0%25B0%25D0%25BB%25D1%258C%25D0%25B2%25D0%25B0%25D1%2580%25D0%25B8%25D0%25B9%25D1%2581%25D0%25BA%25D0%25B0%25D1%258F%2520%25D1%2583%25D0%25BB%25D0%25B8%25D1%2586%25D0%25B0%252C%25201%2520&ll=27.539220%2C53.905021&z=16"];
    NSURL *imaladecLink4 = [NSURL URLWithString:@"https://yandex.by/maps/157/minsk/?mode=search&ol=geo&ouri=ymapsbm1%3A%2F%2Fgeo%3Fll%3D27.687%252C53.944%26spn%3D0.001%252C0.001%26text%3D%25D0%2591%25D0%25B5%25D0%25BB%25D0%25B0%25D1%2580%25D1%2583%25D1%2581%25D1%258C%252C%2520%25D0%259C%25D0%25B8%25D0%25BD%25D1%2581%25D0%25BA%252C%2520%25D0%25BF%25D1%2580%25D0%25BE%25D1%2581%25D0%25BF%25D0%25B5%25D0%25BA%25D1%2582%2520%25D0%259D%25D0%25B5%25D0%25B7%25D0%25B0%25D0%25B2%25D0%25B8%25D1%2581%25D0%25B8%25D0%25BC%25D0%25BE%25D1%2581%25D1%2582%25D0%25B8%252C%2520164%2520&ll=27.686508%2C53.943912&z=16"];
    
    [myBrowser2 loadRequest:[NSURLRequest requestWithURL:imaladecLink2]];
    
    [_myBrowser3 loadRequest:[NSURLRequest requestWithURL:imaladecLink3]];
    
    [_myBrowser4 loadRequest:[NSURLRequest requestWithURL:imaladecLink4]];
    
    // Do any additional setup after loading the view, typically from a nib.
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


-(void)reachabilityChanged:(NSNotification*)note
{
    Reachability * reach = [note object];
    
    if(reach == self.googleReach)
    {
        if([reach isReachable])
        {
            NSString * temp = [NSString stringWithFormat:@"GOOGLE Notification Says Reachable(%@)", reach.currentReachabilityString];
            NSLog(@"%@", temp);
            
            self.notificationLabel.text = temp;
            self.notificationLabel.textColor = [UIColor blackColor];
        }
        else
        {
            NSString * temp = [NSString stringWithFormat:@"GOOGLE Notification Says Unreachable(%@)", reach.currentReachabilityString];
            NSLog(@"%@", temp);
            
            self.notificationLabel.text = temp;
            self.notificationLabel.textColor = [UIColor redColor];
        }
    }
}

- (IBAction)buttonPressed
{
    NSURL *url = [NSURL URLWithString:@"tel:+375293079981"];
    if ([[UIApplication sharedApplication] canOpenURL:url]) { // проверяем возможно ли сделать вызов, вдруг это iPod
        [[UIApplication sharedApplication] openURL:url]; // звоним
    }
}

- (IBAction)buttonPressed2
{
    NSURL *url = [NSURL URLWithString:@"tel:+375333079981"];
    if ([[UIApplication sharedApplication] canOpenURL:url]) { // проверяем возможно ли сделать вызов, вдруг это iPod
        [[UIApplication sharedApplication] openURL:url]; // звоним
    }
}

- (IBAction)buttonPressed3
{
    
}

- (IBAction)createEmail {
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        mail.mailComposeDelegate = self;
        [mail setSubject:@"Ремонт телефонов"];
        [mail setMessageBody:@"Описание проблемы: \n \n \n Ваш контактный номер телефона:" isHTML:NO];
        [mail setToRecipients:@[@"m-helper@inbox.ru"]];
        [mail setCcRecipients:@[@"remontwithstas@gmail.com"]];
        [self presentViewController:mail animated:YES completion:NULL];
    }
    else
    {
        NSLog(@"This device cannot send email");
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"You sent the email.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"You saved a draft of this email");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"You cancelled sending this email.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed:  An error occurred when trying to compose this email");
            break;
        default:
            NSLog(@"An error occurred when trying to compose this email");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}



-(void)someMethod {
   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://remont-telefonov.by"] options:@{} completionHandler:nil];
}



@end
