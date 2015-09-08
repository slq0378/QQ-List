//
//  SLQHeader.h
//  05-QQ列表实现
//
//  Created by Christian on 15/9/8.
//  Copyright © 2015年 slq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SLQFriendGroup;

@interface SLQHeader : UITableViewHeaderFooterView

/**用户分组*/
@property (nonatomic, strong) SLQFriendGroup *friendGroup;

/**按钮*/
@property (nonatomic, weak) UIButton *contentButton;
/** 标签*/
@property (nonatomic, weak) UILabel *onlineLabel;


+ (instancetype)headerWithTableView:(UITableView *)tableView;

@end
