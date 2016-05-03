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
@property NSArray *days;

@end

@implementation RMDTimeClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.days = [[NSArray alloc] initWithObjects:@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", nil];
    //RMDTimeClockView *timeClockView = [[RMDTimeClockView alloc] initWithFrame:self.view.frame timeClockViewController:self];
    //[self.view addSubview:timeClockView];
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(30, 30, 300, 100)];
    [self initializeTextFieldInputView];
    [self.view addSubview:self.textField];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table Delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.days objectAtIndex:section];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
