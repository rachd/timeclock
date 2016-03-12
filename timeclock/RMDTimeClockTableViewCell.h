//
//  RMDTimeClockTableViewCell.h
//  timeclock
//
//  Created by Rachel Dorn on 3/11/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMDTimeClockTableViewCell : UITableViewCell

@property UILabel *title;
@property UILabel *clockInLabel;
@property UILabel *clockOutLabel;
@property UILabel *totalTime;
@property UITextField *clockInField;
@property UITextField *clockOutField;
@property CGFloat tableViewWidth;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title width:(CGFloat)tableViewWidth;

@end
