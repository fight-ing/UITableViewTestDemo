//
//  TestForTableViewVC.h
//  UITableViewTestDemo
//
//  Created by fei on 14-9-4.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestForTableViewVC : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *testTableView;

- (IBAction)testButtonClicked:(UIButton *)sender;
@end
