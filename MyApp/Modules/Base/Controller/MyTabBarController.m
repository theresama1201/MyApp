//
//  MyTabBarController.m
//  MyApp
//
//  Created by Theresa.Ma on 2018/3/22.
//  Copyright © 2018年 Theresa.Ma. All rights reserved.
//

#import "MyTabBarController.h"
#import "MyMemorialDayController.h"
#import "MyNotepadController.h"
#import "MyMoreController.h"
#import "MyPhotoController.h"
#import "MyAddController.h"
#import "AppDelegate.h"
#import "MyControllerFactory.h"
#import "Macro.h"
#import "UIViewController+Initialize.h"
#import "UIColor+Hex.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializedTabBar];
    [self initializedMiddleButton];
    [self initializedTabBarController];
}

- (void)initializedTabBar {
    UITabBar *tabBar = self.tabBar;
    tabBar.translucent = NO;
//    tabBar.shadowImage = [UIImage new];
//    tabBar.backgroundImage = [UIImage new];
//
//    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, -18, MainScreenWidth, 20)];
//    imageV.image = [UIImage imageNamed:@"tabbar_line_img"];
//    imageV.contentMode = UIViewContentModeCenter;
//    [self.tabBar addSubview:imageV];
}

- (void)initializedMiddleButton {
    UIButton *tabbarMiddleBtn = [[UIButton alloc]initWithFrame:CGRectMake(MainScreenWidth / 2 - 25, -18, 50, 50)];
    tabbarMiddleBtn.userInteractionEnabled = NO;
    tabbarMiddleBtn.backgroundColor = [UIColor clearColor];
    tabbarMiddleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [tabbarMiddleBtn setImage:[UIImage imageNamed:@"tabbar_plus_Icon"] forState:UIControlStateNormal];
    [self.tabBar addSubview:tabbarMiddleBtn];
}

- (void)initializedTabBarController {
    MyMemorialDayController *memorialDayController = [MyMemorialDayController initFromNib];
    UIViewController *memorialDayNavController = [self assembledTabBarItemController:memorialDayController withTitle: @"纪念日" imageName:@"tabbar_memorialday_normal" selectedImageName:@"tabbar_memorialday_selected" isMiddleButton:NO];

    MyPhotoController *photoController = [MyPhotoController initFromNib];
    UIViewController *photoNavController = [self assembledTabBarItemController:photoController withTitle:@"生活印记" imageName:@"tabbar_photo_normal" selectedImageName:@"tabbar_photo_selected" isMiddleButton:NO];

    MyAddController *addController = [MyAddController new];
    UIViewController *viewNavController = [self assembledTabBarItemController:addController withTitle:@"记录生活" imageName:@"nil" selectedImageName:@"nil" isMiddleButton:NO];

    MyNotepadController *notepadController = [MyNotepadController initFromNib];
    UIViewController *notepadNavController = [self assembledTabBarItemController:notepadController withTitle:@"记事本" imageName:@"tabbar_notepad_normal" selectedImageName:@"tabbar_notepad_selected" isMiddleButton:NO];

    MyMoreController *moreController = [MyMoreController initFromNib];
    UIViewController * moreNavController = [self assembledTabBarItemController:moreController withTitle:@"更多資訊" imageName:@"tabbar_more_normal" selectedImageName:@"tabbar_more_selected" isMiddleButton:NO];

    self.viewControllers = @[memorialDayNavController, photoNavController, viewNavController, notepadNavController, moreNavController];
}


- (UIViewController *)assembledTabBarItemController:(UIViewController *)controller withTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName isMiddleButton:(BOOL)isMiddleButton {
    // 提前加载 view，以保证在未显示过该 tab 前，可以通过其他入口跳转到正确的页面, 以下同理
    [controller kr_loadViewIfNeeded];
    controller.navigationItem.title = title;
    UIBarButtonItem *myViewItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"my_nav_icon"] style:UIBarButtonItemStyleDone target:[AppDelegate sharedAppDelegate] action:@selector(showMyView)];
    controller.navigationItem.rightBarButtonItem = myViewItem;

    UINavigationController *navigationController = [MyControllerFactory standardNavigationController];
    navigationController.viewControllers = @[controller];
    NSDictionary *textAttributes = @{NSForegroundColorAttributeName:[UIColor P2Color]};
    navigationController.tabBarItem.title = !isMiddleButton ? title : @"";
    [navigationController.tabBarItem setTitleTextAttributes:textAttributes forState:UIControlStateSelected];
    navigationController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigationController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    return navigationController;
}



@end
