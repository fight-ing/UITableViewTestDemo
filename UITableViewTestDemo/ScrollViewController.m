//
//  ScrollViewController.m
//  UITableViewTestDemo
//
//  Created by mac on 14-5-8.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

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
    
    _testScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 100, 600, 800)];
    _testScrollView.contentSize = CGSizeMake(700, 2400);
    _testScrollView.scrollEnabled = NO;
    [self.view addSubview:_testScrollView];
    NSArray *array = [NSArray arrayWithObjects:@"上",@"下", nil];
    for (int i = 0; i < [array count]; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(630, 200, 80, 50);
        [btn setBackgroundColor:[UIColor magentaColor]];
        [btn setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        btn.tag = 100 + i;
        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    
}

-(void)buttonClicked:(UIButton *)btn {
    
    CGPoint point = _testScrollView.contentOffset;
    switch (btn.tag) {
        case 100:
        {
            _testScrollView.contentOffset = CGPointMake(point.x, point.y + 100);
        }
            break;
        case 101:
        {
            _testScrollView.contentOffset = CGPointMake(point.x, point.y - 100);
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
