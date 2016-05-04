//
//  RMDTimeClockInTableViewCell.h
//  timeclock
//
//  Created by Rachel Dorn on 3/11/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMDTimeClockInTableViewCell : UITableViewCell <UITextFieldDelegate>

@property UITextField *clockInField;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
