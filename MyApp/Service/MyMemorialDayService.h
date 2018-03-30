//
//  MyMemorialDayService.h
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/28.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MyMemorialDayModel;

@interface MyMemorialDayService : NSObject

+ (instancetype)sharedInstance;
- (NSArray *)memorialDayList;
- (void)addOneMemorialDay:(MyMemorialDayModel *)memorialDayModel;
- (void)modifyMemorialDay:(MyMemorialDayModel *)memorialDayModel;
- (void)deleteOneMemorialDay:(NSString *)memorialDayId;

@end
