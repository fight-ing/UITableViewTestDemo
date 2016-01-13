//
//  RootViewController.m
//  UITableViewTestDemo
//
//  Created by mac on 14-5-8.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "RootViewController.h"


#define MAX_DATA_COUNT  100
@interface RootViewController ()

@end

@implementation RootViewController

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
    
    self.title = @"rootVC";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < MAX_DATA_COUNT; i ++) {
        NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
        for (int j = 0; j < MAX_DATA_COUNT/5; j ++) {
            NSString *str = [NSString stringWithFormat:@"%d -- %d", i,j];
            
            [array addObject:str];
        }
        [_dataArray addObject:array];
    }
    
    _testTableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width-20, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _testTableView.delegate = self;
    _testTableView.dataSource = self;
    _testTableView.alwaysBounceHorizontal = NO;
    _testTableView.alwaysBounceVertical = NO;
    _testTableView.showsHorizontalScrollIndicator = YES;
    _testTableView.showsVerticalScrollIndicator = YES;
    [self.view addSubview:_testTableView];
    
  
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"** %d **",section];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _testTableView.frame.size.width, 50)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, view.frame.size.width-20, 40)];
    label.text = [NSString stringWithFormat:@"-- %d --",section];
    [view addSubview:label];
    return view;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_dataArray objectAtIndex:section] count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 && indexPath.section == 0) {
        return 200;
    }
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 && indexPath.section == 0) {
        UITableViewCell *customCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        UIScrollView *scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 5, customCell.frame.size.width-20, 200)];
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 120, 200, 100)];
        scrollV.contentSize = CGSizeMake(500, 500);
        scrollV.backgroundColor = [UIColor yellowColor];
        textField.backgroundColor = [UIColor greenColor];
        textField.placeholder = @"点击输入";
        [scrollV addSubview:textField];
        
        [customCell addSubview:scrollV];
        return customCell;
    }
    static NSString *indentifier = @"cellName";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:indentifier];
    }
    NSArray *array = [_dataArray objectAtIndex:indexPath.section];
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"select section:%d ,row:%d",indexPath.section,indexPath.row);
    
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"didDeselect section:%d ,row:%d",indexPath.section,indexPath.row);
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
