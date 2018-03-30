//
//  MyMemorialDayDetailController.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/28.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MyMemorialDayDetailController.h"
#import "MyAlertView.h"
#import "MyMemorialDayService.h"
#import "MyMemorialDayModel.h"
#import "MyDateTool.h"
#import "UIView+Frame.h"
#import "NSNotificationCenter+Category.h"
#import "UIView+Border.h"
#import "UIColor+Hex.h"

@interface MyMemorialDayDetailController ()<MyAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *eventLabel;
@property (weak, nonatomic) IBOutlet UILabel *daysNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *daysUnitLabel;
@property (weak, nonatomic) IBOutlet UILabel *startDateLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *editButtonTrailingConstraint;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@end

@implementation MyMemorialDayDetailController

#pragma mark - Override

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initContentView];
}

#pragma mark - Responder

- (IBAction)clickDeleteButton:(id)sender {
    MyAlertView *alertView = [MyAlertView alertWithTitle:@"亲爱的小主" message:@"每一个纪念日都是值得珍藏的记忆，你确定要删除吗？" delegate:self buttonTitles:@[@"我意已决", @"我再想想"] selectButtonIndex:1];
    [alertView show];
}

- (IBAction)clickEditButton:(id)sender {

}

#pragma mark - MyAlertViewDelegate

- (void)alertView:(MyAlertView *)alertView didTapButtonIndex:(NSInteger)index {
    if (index == 0) {
        [[MyMemorialDayService sharedInstance] deleteOneMemorialDay:self.memorialDayModel.ID];
        [[NSNotificationCenter defaultCenter] postNotificationName:mRefreshMemorialDayListNotification object:nil userInfo:nil];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

#pragma mark - Private

- (void)initContentView {
    if ([self.memorialDayModel.ID containsString:@"0"]) {
        self.editButtonTrailingConstraint.constant = (MainScreenWidth - self.editButton.width) / 2;
        self.deleteButton.hidden = YES;
    }

    [self.editButton drawAllBorderWithWidth:2 cornerRadius:5 color:[UIColor P2Color]];
    [self.deleteButton drawAllBorderWithWidth:2 cornerRadius:5 color:[UIColor P2Color]];
    NSDate *startDate = [MyDateTool dateFromDateString:self.memorialDayModel.startDate];
    self.daysNumberLabel.text = [NSString stringWithFormat:@"%d", [MyDateTool daysToTodayFormDate:startDate]];
    self.startDateLabel.text = self.memorialDayModel.startDate;
    self.eventLabel.text = self.memorialDayModel.name;
}

@end
