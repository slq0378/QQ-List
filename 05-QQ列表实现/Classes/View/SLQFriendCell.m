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

- (void)setFriend:(SLQFriend *)Friend
{
    _Friend = Friend;
 
    self.textLabel.text = Friend.name;
    self.detailTextLabel.text = Friend.intro;
    self.imageView.image = [UIImage imageNamed:Friend.icon];
    self.textLabel.textColor = Friend.isVip ? [UIColor redColor] : [UIColor blackColor];
}

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
