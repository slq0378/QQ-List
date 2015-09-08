//
//  MainViewController.m
//  05-QQ列表实现
//
//  Created by Christian on 15/9/8.
//  Copyright © 2015年 slq. All rights reserved.
//



#import "MainViewController.h"

@interface MainViewController ()
/**朋友数组*/
@property (nonatomic, copy) NSArray *friendList;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.sectionHeaderHeight = 44;
    
}
#pragma mark - 懒加载
- (NSArray *)friendList
{
    if (!_friendList) {
        _friendList = [NSArray array];
        
        // 从plist读取用户信息
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
        NSArray *friends = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *mutableFriends = [NSMutableArray array];
        
        for (NSDictionary *dict in friends) {
            
        }
    }
    return  _friendList;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

/**
 *  返回自定义cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor redColor];
    
    return header;
}

@end
