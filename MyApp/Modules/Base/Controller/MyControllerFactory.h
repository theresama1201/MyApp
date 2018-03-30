//
//  MyControllerFactory.h
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/22.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MyFactoryControllerType) {
    MyFactoryControllerTypeMain,
    MyFactoryControllerTypeMyView
};


@interface MyControllerFactory : NSObject

+ (UIViewController *)controllerWithType:(MyFactoryControllerType)type;
+ (UINavigationController *)standardNavigationController;

@end
