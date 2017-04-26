//
//  UserViewController.m
//  HHRouterExample
//
//  Created by Light on 14-3-14.
//  Copyright (c) 2014年 Huohua. All rights reserved.
//

#import "UserViewController.h"
#import "HHRouter.h"

@interface UserViewController ()

@end

@implementation UserViewController

+ (void)load
{
    [[HHRouter shared] map:@"/user/:userId" toControllerClass:[self class]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点我" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(40, 90, 40, 30);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touchButton:(UIButton *)button
{
    NSString *urlStr = [NSString stringWithFormat:@"/story/%@", @"白雪公主"];
    UIViewController *storyViewController = [[HHRouter shared] matchController:urlStr];
    
    [self.navigationController pushViewController:storyViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
