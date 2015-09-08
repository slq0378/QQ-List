//
//  FriendCell.m
//  05-QQ列表实现
//
//  Created by Christian on 15/9/8.
//  Copyright © 2015年 slq. All rights reserved.
//

#import "SLQFriendCell.H"
#import "SLQFriendGroup.h"
#import "SLQFriend.h"

@implementation SLQFriendCell
/**
 *  setter方法
 */
- (void)setFriend:(SLQFriend *)Friend
{
    _Friend = Friend;
    // 更新数据到控件上
    self.textLabel.text = Friend.name;
    self.detailTextLabel.text = Friend.intro;
    self.imageView.image = [UIImage imageNamed:Friend.icon];
    self.textLabel.textColor = Friend.isVip ? [UIColor redColor] : [UIColor blackColor];
}
/**
 *  返回cell
 */
+ (SLQFriendCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"Cell";
    SLQFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[SLQFriendCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
@end
