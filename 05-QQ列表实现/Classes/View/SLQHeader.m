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
/** 重写初始化方法, 给header加上图标、组名、在线人数等子控件 */
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
   if (self = [super initWithReuseIdentifier:reuseIdentifier])
   {
       // 1、添加按钮
       UIButton *contentButton = [[UIButton alloc] init];
       [self.contentView addSubview:contentButton];
       // 1.0 添加背景图片
       [contentButton setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
       [contentButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
       [contentButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
       // 设置对齐方式
       contentButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
       // 1.1 添加点击事件
       [contentButton addTarget:self action:@selector(contentButtonClick:) forControlEvents:UIControlEventTouchUpInside];
       _contentButton = contentButton;
       
       // 2、最右边标签
       UILabel *onlineLabel = [[UILabel alloc] init];
       [self.contentView addSubview:onlineLabel];
       [onlineLabel setTextAlignment:NSTextAlignmentRight];
       _onlineLabel = onlineLabel;
   }
    return self;
}

- (void)contentButtonClick:(UIButton *)btn
{
    // 隐藏\显示 好友
    self.friendGroup.opened = !self.friendGroup.isOpened;
    // 调用代理方法传递按钮点击消息
    if ([self.delegate respondsToSelector:@selector(headerDidClicked:)]) {
        [self.delegate headerDidClicked:self];
    }
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
    // 3、改变小箭头的方向
    // 由于tableView刷新数据后，所有header会被重新创建，所以要在这里对箭头朝向做出修改
    // 改变箭头朝向，顺时针旋转90度
    CGFloat rotation = self.friendGroup.isOpened? M_PI_2 : 0;
    self.contentButton.imageView.transform = CGAffineTransformMakeRotation(rotation);
}

@end
