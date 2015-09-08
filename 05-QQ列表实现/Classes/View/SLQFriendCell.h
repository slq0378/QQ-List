//
//  FriendCell.h
//  05-QQ列表实现
//
//  Created by Christian on 15/9/8.
//  Copyright © 2015年 slq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SLQFriend;

@interface SLQFriendCell : UITableViewCell

/**模型数组*/
@property (nonatomic, strong) SLQFriend *Friend;


+ (SLQFriendCell *)cellWithTableView:(UITableView *)tableView;

@end
