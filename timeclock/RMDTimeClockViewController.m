//
//  RMDTimeClockViewController.m
//  timeclock
//
//  Created by Rachel Dorn on 3/11/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDTimeClockViewController.h"
#import "RMDTimeClockInTableViewCell.h"
#import "RMDTimeClockOutTableViewCell.h"
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
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
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
    if(indexPath.row == 0) {
        RMDTimeClockInTableViewCell *cellIn = [tableView dequeueReusableCellWithIdentifier:@"cellIn"];
        if (!cellIn) {
            cellIn = [[RMDTimeClockInTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIn"];
        }
        return cellIn;
    }
    else {
        if(indexPath.section != 4) {
            RMDTimeClockOutTableViewCell *cellOut = [tableView dequeueReusableCellWithIdentifier:@"cellOut"];
            if (!cellOut) {
                cellOut = [[RMDTimeClockOutTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellOut"];
            }
            return cellOut;
        }
        else {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
                cell.textLabel.text = @"hi";
            }
            return cell;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
