//
//  MySettingsViewController.h
//  MySettings
//
//  Created by Thomas Kinser on 4/6/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface MySettingsViewController : UIViewController

<UIPickerViewDataSource, UIPickerViewDelegate>
{
    IBOutlet UITextField *title;
    IBOutlet UITextField *comment;
    IBOutlet UIPickerView *favoriteLocation;
}

//@property (nonatomic, retain) UITextField *title;
@property (nonatomic, retain) UITextField *title;
@property (nonatomic, retain) UITextField *comment;
@property (nonatomic, retain) UIPickerView *favoriteLocation;

-(IBAction) loadSettings: (id) sender;
-(IBAction) saveSettings: (id) sender;
-(IBAction) doneEditing: (id) sender;

@end
