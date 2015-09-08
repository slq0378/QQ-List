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

- (void)setFriendGroup:(SLQFriendGroup *)friendGroup
{
    _friendGroup = friendGroup;
 
    self.textLabel.text = friendGroup.name;
}
+ (SLQFriendCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"Cell";
    SLQFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[SLQFriendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

@end
