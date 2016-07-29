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
@property UITableView *tableView;

@end

@implementation RMDTimeClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.days = [[NSArray alloc] initWithObjects:@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", nil];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateClockOut {
    for (int section = 0; section < [self.tableView numberOfSections]; section++) {
        for (int row = 0; row < [self.tableView numberOfRowsInSection:section]; row++) {
            NSIndexPath *cellPathIn = [NSIndexPath indexPathForRow:0 inSection:section];
            NSIndexPath *cellPathOut = [NSIndexPath indexPathForRow:1 inSection:section];
            UITableViewCell* cellIn = [self.tableView cellForRowAtIndexPath:cellPathIn];
            NSLog(@"%i", section);
        }
    }
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
            }
            return cell;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self updateClockOut];
}

@end
