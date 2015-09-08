//
//  SLQFriend.h
//  05-QQ列表实现
//
//  Created by Christian on 15/9/8.
//  Copyright © 2015年 slq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLQFriend : NSObject
/**头像*/
@property (nonatomic, copy) NSString *icon;
/**昵称*/
@property (nonatomic, copy) NSString *name;
/**好友签名*/
@property (nonatomic, copy) NSString *intro;
/**是否是vip*/
@property (nonatomic, assign, getter=isVip) BOOL vip;

- (instancetype)initFriendWithDict:(NSDictionary *)dict;
+ (instancetype)friendWithDict:(NSDictionary *)dict;
@end
