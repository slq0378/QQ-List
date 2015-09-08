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
#import "SLQHeader.h"


@interface MainViewController () <SLQHeaderDelegate>
/**朋友数组*/
@property (nonatomic, copy) NSArray *friendList;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.sectionHeaderHeight = 44;
}
/**
 *  隐藏状态栏
 *
 *  @return YES 是隐藏。默认是no
 */
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - 懒加载
- (NSArray *)friendList
{
    if (!_friendList) {
        _friendList = [NSArray array];
        
        // 从plist读取用户信息
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
        NSArray *friends = [NSArray arrayWithContentsOfFile:path];
         /**
         *  字典转模型
         */
        NSMutableArray *mutableFriends = [NSMutableArray array];
        for (NSDictionary *dict in friends) {
            SLQFriendGroup *group = [SLQFriendGroup FriendGroupWithDictionary:dict];
            [mutableFriends addObject:group];
        }
        _friendList = mutableFriends;
    }
    return  _friendList;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // 返回分组个数
    return self.friendList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 取出具体的组数，然后再取出每组的内容
    SLQFriendGroup *group = self.friendList[section];
    // 根据分组是否打开情况确定如何显示分组，默认关闭
    return group.isOpened ? group.friends.count : 0;
    
//    return  group.friends.count;
}

/**
 *  返回自定义cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1、生成cell
    SLQFriendCell *cell = [SLQFriendCell cellWithTableView:tableView];
    // 2、传递SLQFriend模型
    SLQFriendGroup *group = self.friendList[indexPath.section];
    cell.Friend = group.friends[indexPath.row];
    // 3、返回cell
    return cell;
}

#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // 1、自定义header
    SLQHeader *header = [SLQHeader headerWithTableView:tableView];
    // 2、传递模型
    SLQFriendGroup *group = self.friendList[section];
    header.friendGroup = group;
    header.delegate = self;
    // 3、返回头部
    return header;
}

- (void)headerDidClicked:(SLQHeader *)header
{
    // 刷新表格
    [self.tableView reloadData];
}
@end
