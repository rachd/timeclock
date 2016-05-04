//
//  RMDTimeClockInTableViewCell.m
//  timeclock
//
//  Created by Rachel Dorn on 3/11/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDTimeClockInTableViewCell.h"
#import "RMDConstants.h"

@implementation RMDTimeClockInTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.clockInField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        UIDatePicker *timeInPicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
        timeInPicker.datePickerMode = UIDatePickerModeTime;
        [timeInPicker addTarget:self
                       action:@selector(timeInUpdated:)
             forControlEvents:UIControlEventValueChanged];
        self.clockInField.inputView = timeInPicker;
        self.clockInField.delegate = self;
        UIToolbar *doneBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        [doneBar setBarStyle:UIBarStyleDefault];
        UIBarButtonItem *spacer2 = [[UIBarButtonItem alloc]
                                    initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                    target:nil
                                    action:nil];
        [doneBar setItems: [NSArray arrayWithObjects:spacer2, [[UIBarButtonItem alloc]
                                                               initWithTitle:@"Done"
                                                               style:UIBarButtonItemStyleDone
                                                               target:self.clockInField
                                                               action:@selector(resignFirstResponder)],nil ] animated:YES];
        self.clockInField.inputAccessoryView = doneBar;
        [self.contentView addSubview:self.clockInField];
        
    }
    return self;
}

- (void)timeInUpdated:(UIDatePicker *)timePicker {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateStyle = NSDateFormatterNoStyle;
    formatter.timeStyle = NSDateFormatterShortStyle;
    self.clockInField.text = [formatter stringFromDate:timePicker.date];
}

- (void)dismissPicker:(id)sender {
    [self.clockInField resignFirstResponder];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
