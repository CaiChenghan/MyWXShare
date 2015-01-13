//
//  ViewController.m
//  MyWXShare
//
//  Created by 蔡成汉 on 15/1/12.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import "ViewController.h"
#import "WXApi.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initiaNav];
    
    [self prepareToShare];
    
    //创建2个按钮，一个好友分享，一个好友圈分享
    
    UIButton *buttonOne = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonOne.frame = CGRectMake((self.view.frame.size.width - 200.0)/2, 150, 200, 30);
    [buttonOne setTitle:@"好友分享" forState:UIControlStateNormal];
    [buttonOne setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [buttonOne setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [buttonOne addTarget:self action:@selector(buttonOneIsTouch:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonOne];
    
    UIButton *buttonTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonTwo.frame = CGRectMake((self.view.frame.size.width - 200.0)/2, 250, 200, 30);
    [buttonTwo setTitle:@"好友圈分享" forState:UIControlStateNormal];
    [buttonTwo setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [buttonTwo setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [buttonTwo addTarget:self action:@selector(buttonTwoIsTouch:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonTwo];
    
}

-(void)initiaNav
{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    titleLabel.text = @"微信分享";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:20];
    self.navigationItem.titleView = titleLabel;
}

#pragma mark - 微信分享的配置
-(void)prepareToShare
{
    [WXApi registerApp:@"wxd930ea5d5a258f4f"];
}

#pragma mark - 好友分享
-(void)buttonOneIsTouch:(UIButton *)paramSender
{
    [self doMyShare:@"1"];
}

#pragma mark - 好友圈分享
-(void)buttonTwoIsTouch:(UIButton *)paramSender
{
    [self doMyShare:@"2"];
}

-(void)doMyShare:(NSString *)typeString
{
    if ([typeString isEqualToString:@"1"])
    {
        //好友的分享
        SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
        req.text = @"人文的东西并不是体现在你看得到的方面，它更多的体现在你看不到的那些方面，它会影响每一个功能，这才是最本质的。但是，对这点可能很多人没有思考过，以为人文的东西就是我们搞一个很小清新的图片什么的。”综合来看，人文的东西其实是贯穿整个产品的脉络，或者说是它的灵魂所在。";
        req.bText = YES;
        req.scene = WXSceneSession;
        [WXApi sendReq:req];
    }
    else
    {
        //好友圈的分享
        SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
        req.text = @"人文的东西并不是体现在你看得到的方面，它更多的体现在你看不到的那些方面，它会影响每一个功能，这才是最本质的。但是，对这点可能很多人没有思考过，以为人文的东西就是我们搞一个很小清新的图片什么的。”综合来看，人文的东西其实是贯穿整个产品的脉络，或者说是它的灵魂所在。";
        req.bText = YES;
        req.scene = WXSceneTimeline;
        [WXApi sendReq:req];
    }
    
    
    //需要注意的是，这里的分享，只是纯文字的分享，对于混合消息的分享，具体看消息类。
    //对于这个问题，可参见Demo。
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
