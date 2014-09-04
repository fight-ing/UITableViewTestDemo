//
//  TestForTableViewVC.m
//  UITableViewTestDemo
//
//  Created by fei on 14-9-4.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "TestForTableViewVC.h"

@interface TestForTableViewVC ()
{
    NSMutableArray *testArray;
}
@end

@implementation TestForTableViewVC

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
    testArray = [[NSMutableArray alloc] initWithCapacity:0];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d -- %d ",indexPath.section,indexPath.row];
    if (testArray.count > indexPath.row) {
        NSLog(@"%d %@",indexPath.row,[testArray objectAtIndex:indexPath.row]);
    }
    
    if (indexPath.section == 1) {
        if (testArray.count > indexPath.row && indexPath.row == [[testArray objectAtIndex:indexPath.row] intValue]) {
            cell.detailTextLabel.text = [testArray objectAtIndex:indexPath.row];
        }
    }
    return cell;
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

- (IBAction)testButtonClicked:(UIButton *)sender {
    
    if (testArray.count > 0) {
        [testArray removeAllObjects];
    } else
        for (int i = 0; i < 10; i ++) {
            NSString *str = [NSString stringWithFormat:@"%d",i];
            [testArray addObject:str];
        }
    [_testTableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationBottom];
}
@end
