//
//  CalendarCollectionViewCell.m
//  ZDXCalendar
//
//  Created by Nov on 15/10/6.
//  Copyright © 2015年 Nov. All rights reserved.
//

#import "CalendarCollectionViewCell.h"

@implementation CalendarCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    UIView *backView = [[UIView alloc] initWithFrame:self.bounds];
    [backView setBackgroundColor:[UIColor colorWithRed:0.000 green:0.502 blue:0.502 alpha:1.000]];
    backView.layer.cornerRadius = ([UIScreen mainScreen].bounds.size.width - 40) / 7 / 2;
    [self setSelectedBackgroundView:backView];
}

- (void)setDayStr:(NSString *)dayStr {
    _dayLabel.text = dayStr;
}

- (void)setDayLabelColor:(UIColor *)color {
    _dayLabel.textColor = color;
}

- (NSString *)dayStr {
    return _dayLabel.text;
}

@end
