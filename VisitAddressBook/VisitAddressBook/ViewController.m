//  ViewController.m
//  VisitAddressBooks
//  Created by Tsz on 15/11/11.
//  Copyright © 2015年 Tsz. All rights reserved.

#import "ViewController.h"

#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ViewController ()<ABPeoplePickerNavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark: 使用AddressBook没有界面的访问通讯录

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //1、创建联系人选择导航控制器
    ABPeoplePickerNavigationController *peoplePickerVC = [[ABPeoplePickerNavigationController alloc] init];
    //2、设置 代理
    peoplePickerVC.peoplePickerDelegate = self;
    
    //3、弹出控制器
    [self presentViewController:peoplePickerVC animated:YES completion:nil];
}

#pragma mark 代理方法

/*
 当点击取消的时候会调用
 必须手动实现取消控制器显示的方法
 */

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
}

/**
 选择联系人的时候调用此方法
 如果返回值为YES, 则会跳到下一个界面
 如果返回值为NO, 必须手动实现取消控制器显示的方法
 */

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person{
    
    return YES;
}

/**
 选择联系人的某一属性的时候调用此方法
 如果返回值为YES, 则会进行相应的操作(如果是电话, retuen YES 就会拨打出电话)
 如果返回值为NO, 则不会进行相应的操作(如果是电话, retuen NO 就不会拨打出电话)
 */
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    
    // 如果要跟iOS8的效果保持一致, 必须手动实现取消控制器显示的方法
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
    
    return NO;
}

/**
 *1、选择联系人的时间调次此方法
 */
-  (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person{
    
    //1、方法三
    NSString *firstName = CFBridgingRelease(ABRecordCopyValue(person,kABPersonFirstNameProperty));
    
    NSString *lastName = CFBridgingRelease(ABRecordCopyValue(person, kABPersonLastNameProperty));
    NSLog(@"firstName: %@, lastName: %@", firstName, lastName);
    
    //2、获取电话
    ABMultiValueRef phones = ABRecordCopyValue(person, kABPersonPhoneProperty);
    
    //2、获取电话个数
    CFIndex count = ABMultiValueGetCount(phones);
    
    //3、遍历获取每个电话
    
    for(int i =0 ; i < count ; i++){
        //2.3、获取电话类型标签
        
        NSString *label = CFBridgingRelease(ABMultiValueCopyLabelAtIndex(phones, i));
        //获取电话
        NSString *phone = CFBridgingRelease(ABMultiValueCopyValueAtIndex(phones, i));
        
        NSLog(@"%@ - %@ " , label , phone);
        
    }
    CFRelease(phones);
}


/*
 *  选择联系人的某一属性时调用
 
 *  @param person       选中的联系人
 *  @param property     选中的联系人的属性
 *  @param identifier   选中的联系人的标识
 */

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    
    NSLog(@"%s",__func__);
    
}

- (void)notShow{
//
//    //1、判断是否授权
//    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {
//        //2 、创建通讯录对象
//        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(nil, nil);
//        
//        //3、取出联系人
//        CFArrayRef propleArray = ABAddressBookCopyArrayOfAllPeople(addressBook);
//        
//        //4、取出联系人的个数
//        CFIndex count = CFArrayGetCount(propleArray);
//        
//        //5、遍历联系人 获取对应的数据
//        for (int i = 0; i < count; i++) {
//            
//            ABRecordRef person = CFArrayGetValueAtIndex(propleArray, i);
//            NSString *firstName = CFBridgingRelease(ABRecordCopyValue(person, kABPersonFirstNameProperty));
//            
//            NSString *lastName = CFBridgingRelease(ABRecordCopyValue(person, kABPersonFirstNameProperty));
//            NSLog(@"名： %@   姓： %@" , firstName , lastName);
//            
//            
//            
//#pragma mark: 获取电话 , 一个用户不止一个电话
//            //1、取出电话
//            ABMultiValueRef phones = ABRecordCopyValue(person, kABPersonPhoneProperty);
//            //2、获取电话的个数
//            CFIndex index = ABMultiValueGetCount(phones);
//            
//            //3、遍历取出电话
//            for ( int i = 0;  i< index; i++) {
//                
//                //获取电话类型标签
//                NSString *label = CFBridgingRelease(ABMultiValueCopyLabelAtIndex(phones, i));
//                
//                //打印对话
//                NSString *phone = CFBridgingRelease(ABMultiValueCopyValueAtIndex(phones, i));
//                
//                NSLog(@"姓名： %@  电话： %@" , label , phone);
//            }
//            CFRelease(phones);
//        }
//        
//        CFRelease(propleArray);
//        CFRelease(addressBook);
//    }
}
@end
