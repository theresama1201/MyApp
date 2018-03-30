//
//  MyMemorialDayView.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/27.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MyMemorialDayView.h"
#import "MyMemorialDayCell.h"
#import "MyMemorialDayModel.h"
#import "MyDateTool.h"

static const CGFloat myMemorialDayCellHeight = 50;
static NSString *const MyMemorialDayCellIdentity = @"MyMemorialDayCell";

@interface MyMemorialDayView () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *sinceDayLabel;
@property (weak, nonatomic) IBOutlet UILabel *loveDaysLabel;
@property (weak, nonatomic) IBOutlet UITableView *memorialDayTableView;
@property (nonatomic, strong) NSMutableArray *memorialDaysArray;

@end

@implementation MyMemorialDayView

#pragma mark - Override

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initializeVariable];
    [self configureTableView:self.memorialDayTableView];
}

#pragma mark - Responder

- (void)changeHeaderImg {
    self.headerImageView.hidden = !self.headerImageView.hidden;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.memorialDaysArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyMemorialDayCell *memorialDayCell = [tableView dequeueReusableCellWithIdentifier:MyMemorialDayCellIdentity];
    MyMemorialDayModel *memorialDayModel = [self.memorialDaysArray objectAtIndex:indexPath.row];
    memorialDayCell.memorialDayModel = memorialDayModel;

    return memorialDayCell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(showsMemorialDayDetailView:withMemorialDayModel:)]) {
        [self.delegate showsMemorialDayDetailView:self withMemorialDayModel:[self.memorialDaysArray objectAtIndex:indexPath.row]];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return myMemorialDayCellHeight;
}

#pragma mark - Public

- (void)showMemorialDayViewWithDaysArray:(NSArray *)daysArray {
    [self.memorialDaysArray removeAllObjects];
    [self.memorialDaysArray addObjectsFromArray:daysArray];
    [self showHeaderView:daysArray.firstObject];
    [self.memorialDayTableView reloadData];
}

#pragma mark - Private

-(void)initializeVariable {
    self.memorialDaysArray = [NSMutableArray array];
    UITapGestureRecognizer *changeHeaderImgTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeHeaderImg)];
    self.headerView.userInteractionEnabled = YES;
    [self.headerView addGestureRecognizer:changeHeaderImgTapGesture];
}

- (void)configureTableView:(UITableView *)tableView {
    [tableView registerNib:[UINib nibWithNibName:MyMemorialDayCellIdentity bundle:nil] forCellReuseIdentifier:MyMemorialDayCellIdentity];
    tableView.delegate = self;
    tableView.dataSource = self;
}

- (void)showHeaderView:(MyMemorialDayModel *)memorialDayModel {
    NSDate *startDate = [MyDateTool dateFromDateString:memorialDayModel.startDate];
    self.loveDaysLabel.text = [NSString stringWithFormat:@"%d天", [MyDateTool daysToTodayFormDate:startDate]];
    self.sinceDayLabel.text = [NSString stringWithFormat:@"从%@至今", memorialDayModel.startDate];
}

@end
