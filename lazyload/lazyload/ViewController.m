//
//  ViewController.m
//  lazyload
//
//  Created by wdwk on 2017/5/25.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()
@property(nonatomic, strong)Person *p;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.p=[Person new];
//    我要用到p的时候再加载
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //调用一个没有实现的类方法；(BOOL)resolveClassMethod调用一个没有实现的对象方法；resolveInstanceMethod
//    调用方法1.performSelector
    //self.p现在调用一个没有实现的对象方法；
    [self.p performSelector:@selector(eat)];
    //多个参数可以传数组；
    [self.p performSelector:@selector(eat1:) withObject:@"烧鸡"];
//    调用方法2.消息发送机制，注意在buildSetting中要有相应的设置ENABLE_STRICT_OBJC_MSGSEND = NO
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
