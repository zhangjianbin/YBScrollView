//
//  UIScrollView+Direction.h
//  YBScrollView
//
//  Created by zhangjianbin on 2016/11/7.
//  Copyright © 2016年 zhangjianbin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger ,Direction) {
    DirectionNon=0,
    DirectionUp,//向上滚动
    DirectionDown,//向下滚动

};
@interface UIScrollView (Direction)
@property (nonatomic, assign)Direction direction;
@property (nonatomic, assign) BOOL enableDirection;
@end
