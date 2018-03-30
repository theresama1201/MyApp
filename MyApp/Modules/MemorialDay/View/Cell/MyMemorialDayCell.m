//
//  MyMemorialDayCell.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/27.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MyMemorialDayCell.h"
#import "MyMemorialDayModel.h"
#import "UIView+Border.h"
#import "UIView+Frame.h"
#import "UIColor+Hex.h"
#import "MyDateTool.h"

@interface MyMemorialDayCell ()

@property (weak, nonatomic) IBOutlet UIView *cycleView;
@property (weak, nonatomic) IBOutlet UILabel *eventLabel;
@property (weak, nonatomic) IBOutlet UILabel *daysNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *daysUnitLabel;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *bigCycleLabel;
@property (weak, nonatomic) IBOutlet UILabel *smallCycleLabel;

@end

@implementation MyMemorialDayCell

#pragma mark - Override

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initializeContainerView];
}

#pragma mark - Private

- (void)initializeContainerView {
    [self.containerView drawAllBorderWithWidth:1 cornerRadius:3 color:[UIColor B5Color]];
    [self.bigCycleLabel drawCycle];
    [self.smallCycleLabel drawCycle];
}

- (void)setMemorialDayModel:(MyMemorialDayModel *)memorialDayModel {
    if (!memorialDayModel) {
        return;
    }

    _memorialDayModel = memorialDayModel;
    [self showCellByMemorialDayModelModel:self.memorialDayModel];
}

- (void)showCellByMemorialDayModelModel:(MyMemorialDayModel *)memorialDayModel {
    NSDate *startDate = [MyDateTool dateFromDateString:memorialDayModel.startDate];
    NSString *todayString = [MyDateTool dateStringFromDate:[NSDate date]];
    NSInteger restSeconds = [MyDateTool restSeconds:startDate another:[MyDateTool dateFromDateString:todayString]];

    if (restSeconds > 0) {
        self.eventLabel.text = [memorialDayModel.ID containsString:@"0"] ? memorialDayModel.name : [NSString stringWithFormat:@"距离%@还有", memorialDayModel.name];
        self.daysNumberLabel.text = [NSString stringWithFormat:@"%d", [MyDateTool daysToTodayFormDate:startDate]];
        self.bigCycleLabel.backgroundColor = [UIColor Blue1Color];
        self.daysNumberLabel.backgroundColor = [UIColor Blue1Color];
        self.daysUnitLabel.backgroundColor = [UIColor Blue2Color];
    } else if (restSeconds < 0) {
        self.eventLabel.text = [memorialDayModel.ID containsString:@"0"] ? memorialDayModel.name : [NSString stringWithFormat:@"%@已经", memorialDayModel.name];
        self.daysNumberLabel.text = [NSString stringWithFormat:@"%d", [MyDateTool daysToTodayFormDate:startDate]];
        self.bigCycleLabel.backgroundColor = [UIColor O4Color];
        self.daysNumberLabel.backgroundColor = [UIColor O4Color];
        self.daysUnitLabel.backgroundColor = [UIColor O2Color];
    } else if (restSeconds == 0){
        self.eventLabel.text = [memorialDayModel.ID containsString:@"0"] ? memorialDayModel.name : [NSString stringWithFormat:@"今天是%@", memorialDayModel.name];
        self.bigCycleLabel.backgroundColor = [UIColor P2Color];
        self.daysNumberLabel.backgroundColor = [UIColor P2Color];
        self.daysUnitLabel.backgroundColor = [UIColor P1Color];
        self.daysNumberLabel.text = @"今";
    }
}

@end
