//
//  ViewController.m
//  ZDXCalendar
//
//  Created by Nov on 15/10/6.
//  Copyright © 2015年 Nov. All rights reserved.
//

#import "ViewController.h"

#import "CalendarCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *calendarCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *currentDateLabel;

@property (strong, nonatomic) NSMutableArray *calendarData;
@property (copy, nonatomic) NSArray *allDayArray;

@property (assign, nonatomic) NSUInteger year;
@property (assign, nonatomic) NSUInteger month;
@property (assign, nonatomic) NSUInteger day;

@end

static NSString *kIdentifier = @"CalendarCollectionViewCell";

@implementation ViewController

{
    NSCalendar *_calendar;
    NSDateComponents *_dateComponents;
    NSDate *_currentDate;
    NSDate *_displayDate;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _calendarData = [NSMutableArray array];
    _allDayArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10",
                     @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20",
                     @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30",
                     @"31"];
    
    [self setupCurrentDate];
    [self setupCollectionView];
    
}

- (void)setupCurrentDate {

    _calendar = [NSCalendar currentCalendar];
    _dateComponents = [[NSDateComponents alloc] init];
   _currentDate = [NSDate date];
    
    _dateComponents = [_calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:_currentDate];
    _year = _dateComponents.year;
    _month = _dateComponents.month;
    _day = _dateComponents.day;
    
    [self setupCalendarData];
}

- (void)setupCalendarData {
    
//    NSInteger dayOfMonth = [_calendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:_currentDate];
//    NSLog(@"Day : %d", dayOfMonth);
    
    [_dateComponents setYear:_year];
    [_dateComponents setMonth:_month];
    [_dateComponents setDay:1];
    NSDate *date = [_calendar dateFromComponents:_dateComponents];
    // 获取某月的天数范围
    NSRange dayRange = [_calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    NSLog(@"Range : %@", NSStringFromRange(dayRange));
    // 获取某日为一周第几天
    NSInteger dayOfMonth = [_calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:date];
     NSLog(@"Day : %d", dayOfMonth);
    dayRange.location = 0;
//    dayRange.length = dayRange.length - 1;
    
    // 添加1日前面的
    [_calendarData removeAllObjects];
    for (NSInteger i=0; i<dayOfMonth-1; i++) {
        [_calendarData addObject:@""];
    }
    [_calendarData addObjectsFromArray:[_allDayArray subarrayWithRange:dayRange]];
    [self.calendarCollectionView reloadData];
    
    
    
//    NSInteger dayOfMonth = [_calendar component:NSCalendarUnitDay fromDate:_currentDate];
//    NSLog(@"Day : %d", dayOfMonth);
    
    
    
//    [dateComponents setDay:1];
//    
//    NSDate *firstDate = [calendar dateFromComponents:dateComponents];
//    NSLog(@"Date : %@", firstDate);
//    NSInteger day =  [calendar ordinalityOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitMonth forDate:firstDate];
    
//    NSLog(@"Day : %ld", day);
    
    //
    //    NSInteger day =  [calendar ordinalityOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitMonth forDate:currentDate];
    //    NSLog(@"%d", day);
    //

}

- (void)setupCollectionView {
    
    UINib *calendarNib = [UINib nibWithNibName:kIdentifier bundle:nil];
    [self.calendarCollectionView registerNib:calendarNib forCellWithReuseIdentifier:kIdentifier];
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.calendarCollectionView.collectionViewLayout;
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
}

- (IBAction)frontMonth:(id)sender {
    // 前一个月
    if (_month == 1) {
        _year --;
        _month = 12;
    } else {
        _month --;
    }
    [self updateDisplayDate];
}

- (IBAction)frontYear:(id)sender {
    // 前一年度
    _year --;
    [self updateDisplayDate];
}

- (IBAction)nextMonth:(id)sender {
    // 后一个月
    if (_month == 12) {
        _year ++;
        _month = 1;
    } else {
       _month ++;
    }
    [self updateDisplayDate];
}

- (IBAction)nextYear:(id)sender {
    // 后一年度
    _year ++;
    [self updateDisplayDate];
}

- (void)updateDisplayDate {
    self.currentDateLabel.text = [NSString stringWithFormat:@"%d年%d月", _year, _month];
    
    // 更新日期显示
    [self setupCalendarData];
}





- (BOOL)isCurrentDateWithDay:(NSString *)day {
    [_dateComponents setDay:[day integerValue]];
    NSDate *displayDate = [_calendar dateFromComponents:_dateComponents];
    return [_calendar isDateInToday:displayDate];
}


#pragma mark - UICollectionView Data Source and Delegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat itemSizeFloat = ([UIScreen mainScreen].bounds.size.width - 40) / 7;
    return CGSizeMake(itemSizeFloat, itemSizeFloat);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _calendarData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kIdentifier forIndexPath:indexPath];
    
    if (indexPath.row==0 || indexPath.row%7==0 || (indexPath.row +1)%7==0) {
        [cell setDayLabelColor:[UIColor colorWithRed:1.000 green:0.608 blue:0.369 alpha:1.000]];
    } else {
        // 6 13 20 27 34
        [cell setDayLabelColor:[UIColor colorWithRed:0.000 green:0.502 blue:0.502 alpha:1.000]];
    }
    if ([self isCurrentDateWithDay:_calendarData[indexPath.row]]) {
        UIView *backView = [[UIView alloc] initWithFrame:cell.bounds];
        backView.layer.cornerRadius = ([UIScreen mainScreen].bounds.size.width - 40) / 7 / 2;
        [backView setBackgroundColor:[UIColor redColor]];
        
        cell.backgroundView = backView;
        [cell setDayLabelColor:[UIColor whiteColor]];
    } else {
        cell.backgroundView = nil;
    }
    [cell setDayStr: _calendarData[indexPath.row]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [_dateComponents setDay:[_calendarData[indexPath.row] integerValue]];
    NSDate *displayDate = [_calendar dateFromComponents:_dateComponents];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *message = [NSString stringWithFormat:@"当前选中日期为：%@", [formatter stringFromDate:displayDate]];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提醒" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"确定");
    }];
    [alertController addAction:alertAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    BOOL isCan = [_calendarData[indexPath.row] isEqualToString:@""];
    return !isCan;
}

- (IBAction)rightTouch:(id)sender {
    NSLog(@"right touch");
    [self frontMonth:sender];
}
- (IBAction)leftTouch:(id)sender {
    NSLog(@"left touch");
    [self nextMonth:sender];
}

//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleLightContent;
//}
//
//- (void)setNeedsStatusBarAppearanceUpdate {
//    [super setNeedsStatusBarAppearanceUpdate];
//}
//
//- (UIViewController *)childViewControllerForStatusBarStyle {
//    return self;
//}

#pragma mark - Setter



@end
