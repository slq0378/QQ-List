//
//  SLQHeader.m
//  05-QQ列表实现
//
//  Created by Christian on 15/9/8.
//  Copyright © 2015年 slq. All rights reserved.
//

#import "SLQHeader.h"
#import "SLQFriendGroup.h"
@implementation SLQHeader

- (void)setFriendGroup:(SLQFriendGroup *)friendGroup
{
    _friendGroup = friendGroup;
    self.textLabel.text = friendGroup.name;
}

+ (instancetype)headerWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"header";
    SLQHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (header == nil) {
        header = [[SLQHeader alloc] initWithReuseIdentifier:ID];
    }

    return header;
}


@end
