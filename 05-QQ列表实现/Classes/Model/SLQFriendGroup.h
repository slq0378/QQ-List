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
@property (nonatomic, assign) int online;
/**分组中用户数量*/
@property (nonatomic, copy) NSArray *friends;
/**分组是隐藏还是展开*/
@property (nonatomic, assign,getter=isOpened) BOOL opened;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)FriendGroupWithDictionary:(NSDictionary *)dict;
@end
