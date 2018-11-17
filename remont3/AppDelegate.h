//
//  AppDelegate.h
//  remont3
//
//  Created by Mac on 19.10.16.
//  Copyright © 2016 StanislavAdvanc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@class ViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

