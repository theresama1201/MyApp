//
//  MyMemorialDayModel.h
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/27.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyMemorialDayModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *startDate;
@property (nonatomic) BOOL isDelete;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
