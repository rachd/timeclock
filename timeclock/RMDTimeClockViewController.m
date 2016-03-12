//
//  RMDTimeClockViewController.m
//  timeclock
//
//  Created by Rachel Dorn on 3/11/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDTimeClockViewController.h"
#import "RMDTimeClockView.h"

@interface RMDTimeClockViewController ()

@end

@implementation RMDTimeClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RMDTimeClockView *timeClockView = [[RMDTimeClockView alloc] initWithFrame:self.view.frame timeClockViewController:self];
    
    [self.view addSubview:timeClockView];
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
