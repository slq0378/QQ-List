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

+ (instancetype)headerWithTableView:(UITableView *)tableView;

@end
