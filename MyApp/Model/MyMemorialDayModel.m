//
//  MyMemorialDayModel.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/27.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MyMemorialDayModel.h"

static NSString *const myMemorialDayModelPropertyKeyID = @"ID";
static NSString *const myMemorialDayModelPropertyKeyName = @"name";
static NSString *const myMemorialDayModelPropertyKeyStartDate = @"startDate";
static NSString *const myMemorialDayModelPropertyKeyIsDelete = @"isDelete";

@implementation MyMemorialDayModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.ID = dictionary[myMemorialDayModelPropertyKeyID];
        self.name = dictionary[myMemorialDayModelPropertyKeyName];
        self.startDate = dictionary[myMemorialDayModelPropertyKeyStartDate];
        self.isDelete = [dictionary[myMemorialDayModelPropertyKeyIsDelete] boolValue];
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.ID = [aDecoder decodeObjectForKey:myMemorialDayModelPropertyKeyID];
        self.name = [aDecoder decodeObjectForKey:myMemorialDayModelPropertyKeyName];
        self.startDate = [aDecoder decodeObjectForKey:myMemorialDayModelPropertyKeyStartDate];
        self.isDelete = [aDecoder decodeBoolForKey:myMemorialDayModelPropertyKeyIsDelete];
    }

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.ID forKey:myMemorialDayModelPropertyKeyID];
    [aCoder encodeObject:self.name forKey:myMemorialDayModelPropertyKeyName];
    [aCoder encodeObject:self.startDate forKey:myMemorialDayModelPropertyKeyStartDate];
    [aCoder encodeBool:self.isDelete forKey:myMemorialDayModelPropertyKeyIsDelete];
}

@end
