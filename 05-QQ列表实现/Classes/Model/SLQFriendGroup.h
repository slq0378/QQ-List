//
//  SLQFriendGroup.h
//  05-QQ列表实现
//
//  Created by Christian on 15/9/8.
//  Copyright © 2015年 slq. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SLQFriend;

@interface SLQFriendGroup : NSObject
/**分组名称*/
@property (nonatomic, copy) NSString *name;
/**在线人数*/
@property (nonatomic, assign) BOOL *online;
/**分组中用户数量*/
@property (nonatomic, copy) NSArray *friends;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
