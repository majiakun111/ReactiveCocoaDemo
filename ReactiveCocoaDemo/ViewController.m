//
//  ViewController.m
//  ReactiveCocoaDemo
//
//  Created by Ansel on 16/1/6.
//  Copyright © 2016年 PingAn. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACSubscriber.h>

@interface ViewController () //<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) NSString *warningText;

@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *verifyPassword;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self createUI];
    
    //1 subscribeNext: filter:  map:
//    [RACObserve(self, warningText) subscribeNext:^(id x) {
//        NSLog(@"subscribeNext---%@", x);
//    }];
//
//    [[RACObserve(self, warningText)
//      filter:^(NSString *newString) {
//          return [newString hasPrefix:@"An"];
//      }]
//     subscribeNext:^(NSString *newString) {
//         NSLog(@"filter---%@", newString);
//     }];
//
//    [[RACObserve(self, warningText) map:^id(id value) {
//        return @([value length]);
//    }] subscribeNext:^(id x) {
//        NSLog(@"map---%@", x);
//    }];
    
    
    //2 combineLatest:
//    RAC(self, warningText) = [RACSignal combineLatest:@[RACObserve(self, password), RACObserve(self, verifyPassword)] reduce:^id{
//        
//        if ([_password isEqualToString:_verifyPassword])
//        {
//            return @"Success";
//        }
//        else if([_password length] == 0 || [_verifyPassword length] ==0 )
//        {
//            return @"Please Input";
//        }
//        else {
//            return @"Input Error";
//        }
//    }];
//    
//    [[RACSignal combineLatest:@[RACObserve(self, password), RACObserve(self, verifyPassword)]] subscribeNext:^(RACTuple *value) {
//         NSString *p = [value first];
//         NSString *vp = [value second];
//        if ([p isEqualToString:vp])
//        {
//            self.warningText = @"Success";
//        }
//        else if([p length] == 0 || [vp length] ==0 )
//        {
//            self.warningText = @"Please Input";
//        }
//        else {
//            self.warningText = @"Input Error";
//        }
//    }];
    
    //3 merge  就是不区分消息
//    [[RACSignal merge:@[RACObserve(self, password), RACObserve(self, verifyPassword)]] subscribeNext:^(id x) {
//        
//    }];
    
    //4
//    __block NSInteger subscriptions =0;
//    
//    RACSignal *loggingSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        subscriptions++;
//        [subscriber sendCompleted];
//        
//        return nil;
//    }];
// 
//    // Outputs: 
//    // subscription 1
//    [loggingSignal subscribeCompleted:^{
//        NSLog(@"subscription %ld", (long)subscriptions);
//    }];
//    
//    // Outputs:
//    // subscription 2
//    [loggingSignal subscribeCompleted:^{
//        NSLog(@"subscription %ld", (long)subscriptions);
//    }];
    
//    //5
//    RACSequence *numbers = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;
//    RACSequence *mapped = [numbers map:^id(id value) {
//        return [value stringByAppendingString:value];
//    }];
//    NSLog(@"%@", mapped.array);
    
    //6.
//    [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        [subscriber sendNext:@"12"];
//        return nil;
//        
//    }] subscribeNext:^(id x) {
//        NSLog(@"%@", x); //12
//    }];
    
    
    /** 7
     *@brief创建一个定时器信号，每三秒发出一个当时日期值。一共发5次。
     */
//    RACSignal *signalInterval=[RACSignal interval:30 onScheduler:[RACScheduler mainThreadScheduler]];
//    signalInterval=[signalInterval take:5];
//    [signalInterval subscribeNext:^(id x) {
//        NSLog(@"1111");
//    }];
    
    
    //8
    // RACSubject:底层实现和RACSignal不一样。
    // 1.调用subscribeNext订阅信号，只是把订阅者保存起来，并且订阅者的nextBlock已经赋值了。
    // 2.调用sendNext发送信号，遍历刚刚保存的所有订阅者，一个一个调用订阅者的nextBlock。
//
//    RACSubject *subject = [RACSubject subject];
//    
//    RACDisposable *disposable = [subject subscribeNext:^(id x) { //订阅信号
//        // block调用时刻：当信号发出新值，就会调用.
//        NSLog(@"第一个订阅者%@",x);
//        
//        [disposable dispose];
//        
//        
//    }];
//    [subject subscribeNext:^(id x) { //订阅信号
//        // block调用时刻：当信号发出新值，就会调用.
//        NSLog(@"第二个订阅者%@",x);
//    }];
//    [subject sendNext:@"1"];
    
    
    //9.
//    RACReplaySubject *replaySubject = [RACReplaySubject subject];// 创建信号
//    [replaySubject sendNext:@1]; // 发送信号
//    [replaySubject sendNext:@2];
//
//    [replaySubject subscribeNext:^(id x) { // 订阅信号
//        NSLog(@"第一个订阅者接收到的数据%@",x);
//    }];
//    [replaySubject subscribeNext:^(id x) {
//        NSLog(@"第二个订阅者接收到的数据%@",x);
//    }];
//    
    
    //10
//     RACMulticastConnection使用步骤:
//     1.创建信号 + (RACSignal *)createSignal:(RACDisposable * (^)(id<RACSubscriber> subscriber))didSubscribe
//     2.创建连接 RACMulticastConnection *connect = [signal publish];
//     3.订阅信号,注意：订阅的不在是之前的信号，而是连接的信号。 [connect.signal subscribeNext:nextBlock]
//     4.连接 [connect connect]
//    
//     RACMulticastConnection底层原理:
//     1.创建connect，connect.sourceSignal -> RACSignal(原始信号)  connect.signal -> RACSubject
//     2.订阅connect.signal，会调用RACSubject的subscribeNext，创建订阅者，而且把订阅者保存起来，不会执行block。
//     3.[connect connect]内部会订阅RACSignal(原始信号)，并且订阅者是RACSubject
//     3.1.订阅原始信号，就会调用原始信号中的didSubscribe
//     3.2 didSubscribe，拿到订阅者调用sendNext，其实是调用RACSubject的sendNext
//     4.RACSubject的sendNext,会遍历RACSubject所有订阅者发送信号。
//     4.1 因为刚刚第二步，都是在订阅RACSubject，因此会拿到第二步所有的订阅者，调用他们的nextBlock
    
    
//    // 需求：假设在一个信号中发送请求，每次订阅一次都会发送请求，这样就会导致多次请求。
//    // 解决：使用RACMulticastConnection就能解决.
//    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {// 1.创建请求信号
//        NSLog(@"发送请求");
//        return nil;
//    }];
//    [signal subscribeNext:^(id x) {//订阅信号
//        NSLog(@"接收数据");
//    }];
//    [signal subscribeNext:^(id x) {
//        NSLog(@"接收数据");
//    }];
//    // 3.运行结果，会执行两遍发送请求，也就是每次订阅都会发送一次请求
//    
//    
    // RACMulticastConnection:解决重复请求问题
//    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {   // 1.创建信号
//
//        NSLog(@"发送请求");
//        [subscriber sendNext:@1];
//        
//        return nil;
//    }];
//    
//    RACMulticastConnection *connect = [signal publish];    // 2.创建连接
//    
//    // 注意：订阅信号，也不能激活信号，只是保存订阅者到数组，必须通过连接,当调用连接，就会一次性调用所有订阅者的sendNext:
//    [connect.signal subscribeNext:^(id x) {     // 3.订阅信号，
//        
//        NSLog(@"订阅者一信号");
//        
//    }];
//    
//    [connect.signal subscribeNext:^(id x) {    // 3.订阅信号，
//        
//        NSLog(@"订阅者二信号");
//        
//    }];
//    
//    [connect connect];  // 4.连接,激活信号
    
    //11
    // 1、创建信号
//    RACSubject *signal = [RACSubject subject];
//    
//    // 2、处理信号，订阅信号
//    [[signal take:1] subscribeNext:^(id x) {
//        
//        NSLog(@"%@",x); //只打印 1
//    }];
//    
//    // 3.发送信号
//    [signal sendNext:@1];
//    
//    [signal sendNext:@2];
    
    //12 自己调用 bind
//    RACSignal *signalInterval = [RACSignal interval:1.0 onScheduler:[RACScheduler mainThreadScheduler]];
//    RACSignal *bindSignal = [signalInterval bind:^RACStreamBindBlock{
//        
//        return ^(NSDate *value, BOOL *stop) {
//              NSLog(@"inner value: %@", value);
//              NSTimeInterval nowTime = [value timeIntervalSince1970];
//              return [RACSignal return:@(nowTime)];
//            };
//        
//      }];
//    
//    [bindSignal subscribeNext:^(id x) {
//        NSLog(@"outer value: %@", x);
//    }];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //1.
//    self.warningText = @"Ansel";
    
    //2
//    self.password = @"123";
//    self.verifyPassword = @"123";
//
//    NSLog(@"warningText:%@", self.warningText);
//
    //3
//    self.password = @"123";
//    self.verifyPassword = @"12vv3";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PrivateMethod

- (void)createUI
{
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - property

- (UITableView *)tableView
{
    if (nil == _tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.rowHeight = 44;
//        _tableView.delegate = self;
//        _tableView.dataSource = self;
    }
    
    return _tableView;
}

- (NSArray *)dataArray
{
    if (nil == _dataArray) {
//        _dataArray = [{@""}]
    }
    
    return _dataArray;
}


@end
