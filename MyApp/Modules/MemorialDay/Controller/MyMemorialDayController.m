//
//  MyMemorialDayController.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/22.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MyMemorialDayController.h"
#import "MyMemorialDayDetailController.h"
#import "MyMemorialDayView.h"
#import "MyMemorialDayService.h"
#import "MyMemorialDayModel.h"
#import "UIViewController+Initialize.h"
#import "NSNotificationCenter+Category.h"

@interface MyMemorialDayController () <MyMemorialDayViewDelegate>

@property (strong, nonatomic) IBOutlet MyMemorialDayView *memorialDayView;

@end

@implementation MyMemorialDayController

#pragma mark - Override

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initContentView];
    [self addNotificationObserver];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Private

- (void)handleRefreshMemorialDayListNotification:(NSNotification *)notification {
    [self.memorialDayView showMemorialDayViewWithDaysArray:[[MyMemorialDayService sharedInstance] memorialDayList]];
}

#pragma mark - MyMemorialDayViewDelegate

- (void)showsMemorialDayDetailView:(MyMemorialDayView *)myMemorialDayView withMemorialDayModel:(MyMemorialDayModel *)memorialDayModel {
    MyMemorialDayDetailController *memorialDayDetailController = [MyMemorialDayDetailController initFromNib];
    memorialDayDetailController.memorialDayModel = memorialDayModel;
    memorialDayDetailController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:memorialDayDetailController animated:YES];    
}

#pragma mark - Private

- (void)initContentView {
    self.memorialDayView.delegate = self;
    [self.memorialDayView showMemorialDayViewWithDaysArray:[[MyMemorialDayService sharedInstance] memorialDayList]];
}

- (void)addNotificationObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleRefreshMemorialDayListNotification:) name:mRefreshMemorialDayListNotification object:nil];
}

@end
