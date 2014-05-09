//
//  RootViewController.h
//  UITableViewTestDemo
//
//  Created by mac on 14-5-8.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_testTableView;
    NSMutableArray *_dataArray;
}

@end
