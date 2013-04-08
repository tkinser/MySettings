//
//  MySettingsViewController.m
//  MySettings
//
//  Created by Thomas Kinser on 4/6/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import "MySettingsViewController.h"

@implementation MySettingsViewController

@synthesize title;
@synthesize comment;
@synthesize favoriteLocation;
NSMutableArray *locations;
NSString *favoriteLocationSelected;

-(IBAction) doneEditing:(id) sender {
    [sender resignFirstResponder];
}

- (void)viewDidLoad {
    //---create an array containing the colors values---
    locations = [[NSMutableArray alloc] init];
    [locations addObject:@"Work"];
    [locations addObject:@"Home"];
    [locations addObject:@"Other"];
    [super viewDidLoad];
}

//---number of components in the Picker view---
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

//---number of items(rows) in the Picker view---
- (NSInteger)pickerView:(UIPickerView *)thePickerView
numberOfRowsInComponent:(NSInteger)component {
    return [locations count];
}

//---populating the Picker view---
- (NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    return [locations objectAtIndex:row];
}

//---the item selected by the user---
- (void)pickerView:(UIPickerView *)thePickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    favoriteLocationSelected = [locations objectAtIndex:row];
}

-(IBAction) loadSettings: (id) sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    title.text = [defaults objectForKey:@"title"];
    comment.text = [defaults objectForKey:@"comment"];
    
    //---find the index of the array for the location saved---
    favoriteLocationSelected = [[NSString alloc] initWithString:
                             [defaults objectForKey:@"location"]];
    int selIndex = [locations indexOfObject:favoriteLocationSelected];
    
    //---display the saved location in the Picker view---
    [favoriteLocation selectRow:selIndex inComponent:0 animated:YES];
}

-(IBAction) saveSettings: (id) sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:title.text forKey:@"title"];
    [defaults setObject:comment.text forKey:@"comment"];
    [defaults setObject:favoriteLocationSelected forKey:@"location"];
    [defaults synchronize];
    
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"Settings Value Saved"
                               message:@"Settings Saved"
                              delegate:nil
                     cancelButtonTitle:@"Done"
                     otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)dealloc {
    [locations release];
    [favoriteLocationSelected release];
    [title release];
    [comment release];
    [favoriteLocation release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
