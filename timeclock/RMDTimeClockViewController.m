//
//  RMDTimeClockViewController.m
//  timeclock
//
//  Created by Rachel Dorn on 3/11/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDTimeClockViewController.h"
#import "RMDTimeClockView.h"
#import <UIKit/UIKit.h>

@interface RMDTimeClockViewController ()

@property UITextField *textField;
@property UIDatePicker *timePicker;

@end

@implementation RMDTimeClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //RMDTimeClockView *timeClockView = [[RMDTimeClockView alloc] initWithFrame:self.view.frame timeClockViewController:self];
    //[self.view addSubview:timeClockView];
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(30, 30, 300, 100)];
    [self initializeTextFieldInputView];
    [self.view addSubview:self.textField];
}

- (void)initializeTextFieldInputView {
    UIDatePicker *timePicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
    timePicker.datePickerMode = UIDatePickerModeTime;
    [timePicker addTarget:self
                   action:@selector(timeUpdated:)
         forControlEvents:UIControlEventValueChanged];
    self.textField.inputView = timePicker;
}

- (void)timeUpdated:(UIDatePicker *)timePicker {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateStyle = NSDateFormatterNoStyle;
    formatter.timeStyle = NSDateFormatterShortStyle;
    self.textField.text = [formatter stringFromDate:timePicker.date];
}

- (void)doneButtonWasPressed:(UIBarButtonItem *)doneButton {
    NSLog(@"here");
    [self.timePicker resignFirstResponder];
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

@end
