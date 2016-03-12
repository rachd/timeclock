//
//  RMDTimeClockView.m
//  timeclock
//
//  Created by Rachel Dorn on 3/11/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDTimeClockView.h"
#import "RMDTimeClockTableViewCell.h"
#import "RMDTimeClockViewController.h"

@interface RMDTimeClockView () <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) RMDTimeClockTableViewCell *mondayCell;
@property (strong, nonatomic) RMDTimeClockTableViewCell *tuesdayCell;
@property (strong, nonatomic) RMDTimeClockTableViewCell *wednesdayCell;
@property (strong, nonatomic) RMDTimeClockTableViewCell *thursdayCell;
@property (strong, nonatomic) RMDTimeClockTableViewCell *fridayCell;
@property (strong, nonatomic) RMDTimeClockViewController *timeClockViewController;
@property (strong, nonatomic) UITableView *timeClockTableView;

@end

@implementation RMDTimeClockView

- (instancetype)initWithFrame:(CGRect)frame timeClockViewController:(RMDTimeClockViewController *)timeClockViewController {
    self = [super initWithFrame:frame];
    
    if (self) {
        _timeClockViewController = timeClockViewController;
        
        [self setUpCells];
        [self setUpTimeClockTableView];
    }
    
    return self;
}

- (void)setUpCells {
    self.mondayCell = [[RMDTimeClockTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil title:@"Monday" width:self.frame.size.width];
    self.tuesdayCell = [[RMDTimeClockTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil title:@"Tuesday" width:self.frame.size.width];
    self.wednesdayCell = [[RMDTimeClockTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil title:@"Wednesday" width:self.frame.size.width];
    self.thursdayCell = [[RMDTimeClockTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil title:@"Thursday" width:self.frame.size.width];
    self.fridayCell = [[RMDTimeClockTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil title:@"Friday" width:self.frame.size.width];
}

- (void)setUpTimeClockTableView {
    self.timeClockTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height / 10, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    self.timeClockTableView.rowHeight = 80;
    [self.timeClockTableView setDataSource:self];
    [self.timeClockTableView setDelegate:self];
    [self addSubview:self.timeClockTableView];
}

# pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row ==  0) {
            return self.mondayCell;
        } else if (indexPath.row == 1) {
            return self.tuesdayCell;
        } else if (indexPath.row == 2) {
            return self.wednesdayCell;
        } else if (indexPath.row == 3) {
            return self.thursdayCell;
        } else {
            return self.fridayCell;
        }
    }
    
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 10;
    }
    else {
        return 0.10f;
    }
}


@end