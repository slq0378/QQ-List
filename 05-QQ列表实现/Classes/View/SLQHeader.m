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
    // 加空格，让图片和文字产生一个间隔
    NSString *name = [NSString stringWithFormat:@" %@",friendGroup.name];
    [self.contentButton setTitle:name forState:UIControlStateNormal];
    [self.contentButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    self.onlineLabel.text = [NSString stringWithFormat:@"%zd/%zd",friendGroup.online,friendGroup.friends.count];
    
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

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
   if (self = [super initWithReuseIdentifier:reuseIdentifier])
   {
       // 添加其他控件
       // 按钮
       UIButton *contentButton = [[UIButton alloc] init];
       [self.contentView addSubview:contentButton];
       [contentButton setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
       [contentButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
       [contentButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
       contentButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
       _contentButton = contentButton;
       // 最右边标签
       UILabel *onlineLabel = [[UILabel alloc] init];
       [self.contentView addSubview:onlineLabel];
       [onlineLabel setTextAlignment:NSTextAlignmentRight];
       _onlineLabel = onlineLabel;
   }
    return self;

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 布局添加的子控件
    // 1、背景
    self.contentButton.frame = self.bounds;
    // 稍微向右偏移一点
    self.contentButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    // 2、标签:在线人数/组内总人数
    NSInteger countWidth = 150;
    NSInteger countHeight = self.bounds.size.height;
    NSInteger countX = self.bounds.size.width - 10 - countWidth;
    NSInteger countY = 0;
    self.onlineLabel.frame = CGRectMake(countX, countY, countWidth, countHeight);
    
    
}

@end
