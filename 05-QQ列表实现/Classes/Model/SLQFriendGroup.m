//
//  SLQFriendGroup.m
//  05-QQ列表实现
//
//  Created by Christian on 15/9/8.
//  Copyright © 2015年 slq. All rights reserved.
//

#import "SLQFriendGroup.h"
#import "SLQFriend.h"

@implementation SLQFriendGroup

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        // 1、KVC字典转模型
        [self setValuesForKeysWithDictionary:dict];
        // 2、然后再转换数组中信息
        NSMutableArray *groupFriends = [NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
            SLQFriend *friend = [SLQFriend friendWithDict:dict];
        }
        
    }
    return self;
}
@end
