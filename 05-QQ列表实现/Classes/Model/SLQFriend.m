//
//  SLQFriend.m
//  05-QQ列表实现
//
//  Created by Christian on 15/9/8.
//  Copyright © 2015年 slq. All rights reserved.
//

#import "SLQFriend.h"

@implementation SLQFriend

- (instancetype)initFriendWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        // kvc字典转模型
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)friendWithDict:(NSDictionary *)dict
{
    return [[self alloc] initFriendWithDict:dict];
}
@end
