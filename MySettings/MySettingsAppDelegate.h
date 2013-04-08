//
//  MySettingsAppDelegate.h
//  MySettings
//
//  Created by Thomas Kinser on 4/6/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MySettingsViewController;

@interface MySettingsAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MySettingsViewController *viewController;

@end