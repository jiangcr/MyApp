//
//  AppDelegate.m
//  MyApp
//
//  Created by jiang on 2017/8/22.
//  Copyright © 2017年 skydrui. All rights reserved.
//

#import "AppDelegate.h"
#import "MyItemListVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    //适配不同尺寸屏幕
    [self AdaptiveSize];
    
    MyItemListVC * vc = [[MyItemListVC alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)AdaptiveSize {
    if (ScreenHeight > 480&&ScreenWidth < ScreenHeight) {
        //4寸屏以上，且为竖屏
        self.autoSizeScaleX = ScreenWidth/375;
        self.autoSizeScaleY = ScreenHeight/667;
    }else if(ScreenWidth > 480&&ScreenWidth > ScreenHeight){
        //4寸屏以上，横屏
        self.autoSizeScaleX = ScreenWidth/667;
        self.autoSizeScaleY = ScreenHeight/375;
    }else if(ScreenWidth < 480&&ScreenWidth > ScreenHeight){
        //3.5寸横屏
        self.autoSizeScaleX = 568/667;
        self.autoSizeScaleY = ScreenHeight/375;
    }else{
        //3.5寸竖屏  只按宽的比例
        self.autoSizeScaleX = ScreenWidth/375;
        self.autoSizeScaleY = ScreenWidth/375;
    }
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
