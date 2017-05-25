//
//  Person.m
//  lazyload
//
//  Created by wdwk on 2017/5/25.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person
//如果调用一个没有实现的类方法；
//+(BOOL)resolveClassMethod:(SEL)sel{
//}
//如果调用一个没有实现的对象方法；
+(BOOL)resolveInstanceMethod:(SEL)sel
{
    NSLog(@"%@",NSStringFromSelector(sel));
    //不带参数的
    if (sel==@selector(eat)) {
//        1.：类，2.方法名字（方法的选择），3.方法实现（怎么告诉c运用呢，通过函数指针block）4.返回值类型（c语言字符串）//(IMP)eat强转
        //什么时候用到动态创建方法，
        class_addMethod([Person class], sel, (IMP)eat,"v@:");
    }
    else if (sel==@selector(eat1:)){
        class_addMethod([Person class], sel, (IMP)eat1, "V@:@");
    }
    return [super resolveInstanceMethod:sel];
}
//动态添加一个方法的实现
//不带参数
//每个函数都有id self, SEL _cmd的参数，这是一个隐形参数,可以不写的
void eat(id self, SEL _cmd){
    NSLog(@"调用：%@类---%@方法",self,NSStringFromSelector(_cmd));
}
void eat1(id self, SEL _cmd,id obj){
     NSLog(@"我吃了：%@",obj);
}
@end
