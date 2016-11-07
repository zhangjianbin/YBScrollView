//
//  ViewController.m
//  YBScrollView
//
//  Created by zhangjianbin on 2016/11/7.
//  Copyright © 2016年 zhangjianbin. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+Direction.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.delegate = self;
    scrollView.enableDirection = YES;
    scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight*2);
    [self.view addSubview:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"=======%zd", scrollView.direction);
}

@end
