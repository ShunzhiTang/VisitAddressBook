//
//  ViewController.m
//  VisitAddressBook
//
//  Created by Tsz on 15/11/11.
//  Copyright © 2015年 Tsz. All rights reserved.

#import "ViewController.h"
#import <AddressBook/AddressBook.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark: 使用AddressBook没有界面的访问通讯录

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //1、判断是否授权
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {
        //2 、创建通讯录对象
        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(nil, nil);
        
        //3、取出联系人
        CFArrayRef propleArray = ABAddressBookCopyArrayOfAllPeople(addressBook);
        
        //4、取出联系人的个数
        CFIndex count = CFArrayGetCount(propleArray);
        
        //5、遍历联系人 获取对应的数据
        for (int i = 0; i < count; i++) {
            
            ABRecordRef person = CFArrayGetValueAtIndex(propleArray, i);
            NSString *firstName = CFBridgingRelease(ABRecordCopyValue(person, kABPersonFirstNameProperty));
            
            NSString *lastName = CFBridgingRelease(ABRecordCopyValue(person, kABPersonFirstNameProperty));
            NSLog(@"名： %@   姓： %@" , firstName , lastName);
            
            
            
#pragma mark: 获取电话 , 一个用户不止一个电话
            //1、取出电话
            ABMultiValueRef phones = ABRecordCopyValue(person, kABPersonPhoneProperty);
            //2、获取电话的个数
            CFIndex index = ABMultiValueGetCount(phones);
            
            //3、遍历取出电话
            for ( int i = 0;  i< index; i++) {
                
                //获取电话类型标签
                NSString *label = CFBridgingRelease(ABMultiValueCopyLabelAtIndex(phones, i));
                
                //打印对话
                NSString *phone = CFBridgingRelease(ABMultiValueCopyValueAtIndex(phones, i));
                
                NSLog(@"姓名： %@  电话： %@" , label , phone);
            }
            CFRelease(phones);
        }
        
        CFRelease(propleArray);
        CFRelease(addressBook);
    }
}

@end
