//
//  RMDTimeClockOutTableViewCell.m
//  timeclock
//
//  Created by Rachel Dorn on 5/3/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDTimeClockOutTableViewCell.h"
#import "RMDConstants.h"

@implementation RMDTimeClockOutTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.clockOutField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        UIDatePicker *timeOutPicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
        timeOutPicker.datePickerMode = UIDatePickerModeTime;
        [timeOutPicker addTarget:self
                         action:@selector(timeOutUpdated:)
               forControlEvents:UIControlEventValueChanged];
        self.clockOutField.inputView = timeOutPicker;
        self.clockOutField.delegate = self;
        UIToolbar *doneBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        [doneBar setBarStyle:UIBarStyleDefault];
        UIBarButtonItem *spacer2 = [[UIBarButtonItem alloc]
                                    initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                    target:nil
                                    action:nil];
        [doneBar setItems: [NSArray arrayWithObjects:spacer2, [[UIBarButtonItem alloc]
                                                               initWithTitle:@"Done"
                                                               style:UIBarButtonItemStyleDone
                                                               target:self.clockOutField
                                                               action:@selector(resignFirstResponder)],nil ] animated:YES];
        self.clockOutField.inputAccessoryView = doneBar;
        [self.contentView addSubview:self.clockOutField];
        
    }
    return self;
}

- (void)timeOutUpdated:(UIDatePicker *)timePicker {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateStyle = NSDateFormatterNoStyle;
    formatter.timeStyle = NSDateFormatterShortStyle;
    self.clockOutField.text = [formatter stringFromDate:timePicker.date];
}

- (void)dismissPicker:(id)sender {
    [self.clockOutField resignFirstResponder];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
