//
//  Macro.h
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/22.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

//颜色
#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#define pageSize 10
#define MainScreenWidth [[UIScreen mainScreen]bounds].size.width
#define MainScreenHeight [[UIScreen mainScreen]bounds].size.height
#define Iphone5Width 320
#define iPhoneX (MainScreenWidth == 375.f && MainScreenHeight == 812.f ? YES : NO)
#define TabbarHeight (iPhoneX ? (49.f + 34.f) : 49.f)
#define StatusBarHeight (iPhoneX ? 44.f : 20.f)
#define NavigationBarHeight 44.f
#define TabbarSafeBottomMargin (iPhoneX ? 34.f : 0.f)
#define NavBarAndStatusBarHeight (iPhoneX ? 88.f : 64.f)
#define ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})

#endif /* Macro_h */
