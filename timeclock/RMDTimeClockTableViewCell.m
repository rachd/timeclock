//
//  RMDTimeClockTableViewCell.m
//  timeclock
//
//  Created by Rachel Dorn on 3/11/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDTimeClockTableViewCell.h"
#import "RMDConstants.h"

@implementation RMDTimeClockTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title width:(CGFloat)tableViewWidth {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        _tableViewWidth = tableViewWidth;
        _title = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, self.tableViewWidth / 2, 15)];
        self.title.text = title;
        self.title.font = [RMDConstants kArialMedium];
        self.title.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.title];
        
        _clockInLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, self.tableViewWidth / 2, 15)];
        self.clockInLabel.text = @"Clock In: ";
        self.clockInLabel.font = [RMDConstants kArialSmall];
        self.clockInLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.clockInLabel];
        
        _clockOutLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 55, self.tableViewWidth / 2, 15)];
        self.clockOutLabel.text = @"Clock Out: ";
        self.clockOutLabel.font = [RMDConstants kArialSmall];
        self.clockOutLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.clockOutLabel];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
