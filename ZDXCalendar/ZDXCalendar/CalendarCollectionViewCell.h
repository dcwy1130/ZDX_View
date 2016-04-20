//
//  CalendarCollectionViewCell.h
//  ZDXCalendar
//
//  Created by Nov on 15/10/6.
//  Copyright © 2015年 Nov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (copy, nonatomic) NSString *dayStr;

- (void)setDayLabelColor:(UIColor *)color;

//- (void)displayCurrentDay:(BOOL)isToday;

@end
