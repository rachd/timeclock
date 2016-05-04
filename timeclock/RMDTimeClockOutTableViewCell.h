//
//  RMDTimeClockOutTableViewCell.h
//  timeclock
//
//  Created by Rachel Dorn on 5/3/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMDTimeClockOutTableViewCell : UITableViewCell <UITextFieldDelegate>

@property UITextField *clockOutField;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
