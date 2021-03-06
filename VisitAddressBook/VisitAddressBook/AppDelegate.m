//
//  AppDelegate.m
//  VisitAddressBook
//
//  Created by Tsz on 15/11/11.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "AppDelegate.h"
#import <AddressBook/AddressBook.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
#pragma mark 程序启动进行授权
    
//    //1、获取授权状态
//    ABAuthorizationStatus status = ABAddressBookGetAuthorizationStatus();
//    
//    //2、判断是否授权，如果没有授权就进行授权
//    /**
//     kABAuthorizationStatusNotDetermined = 0,  没有授权
//     kABAuthorizationStatusRestricted,         许可配置阻止了与通讯录的交互
//     kABAuthorizationStatusDenied,             用户拒绝
//     kABAuthorizationStatusAuthorized          用户授权
//     */
//    if (status == kABAuthorizationStatusNotDetermined) {
//        //2.1 、创建通讯录对象
//        
//        ABAddressBookRef addressRef = ABAddressBookCreateWithOptions(nil, nil);
//        
//        //2.2 、请求授权
//        ABAddressBookRequestAccessWithCompletion(addressRef, ^(bool granted, CFErrorRef error) {
//           
//            //2.2.1 、出错
//            if (error) return;
//            
//             //2.2.2 、判断授权
//            
//            if(granted){
//                NSLog(@"授权成功");
//            }else{
//                NSLog(@"授权失败");
//            }
//        });
//    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
