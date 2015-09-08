//
//  MainViewController.m
//  05-QQ列表实现
//
//  Created by Christian on 15/9/8.
//  Copyright © 2015年 slq. All rights reserved.
//



#import "MainViewController.h"
#import "SLQFriend.h"
#import "SLQFriendGroup.h"
#import "SLQFriendCell.H"


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
            SLQFriendGroup *group = [SLQFriendGroup FriendGroupWithDictionary:dict];
            [mutableFriends addObject:group];
        }
        NSLog(@"%@",mutableFriends);
        _friendList = mutableFriends;
    }
    return  _friendList;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // 返回组数
    return self.friendList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 取出具体的组数，然后再取出每组的内容
    SLQFriendGroup *group = self.friendList[section];
    return group.friends.count;
}

/**
 *  返回自定义cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 封装cell初始化
    SLQFriendCell *cell = [SLQFriendCell cellWithTableView:tableView];
    // 传递模型
    SLQFriendGroup *group = self.friendList[indexPath.section];
    cell.friendGroup = group;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor redColor];
    
    return header;
}

@end
