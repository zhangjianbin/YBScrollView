//
//  UIScrollView+Direction.m
//  YBScrollView
//
//  Created by zhangjianbin on 2016/11/7.
//  Copyright © 2016年 zhangjianbin. All rights reserved.
//

#import "UIScrollView+Direction.h"
#import <objc/runtime.h>
@implementation UIScrollView (Direction)

-(void)setDirection:(Direction)direction{

    objc_setAssociatedObject(self, @selector(direction), @(direction), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (Direction)direction{

    NSNumber * number = objc_getAssociatedObject(self, @selector(direction));
    return number.integerValue;
}
- (void)setEnableDirection:(BOOL)enableDirection{

    objc_setAssociatedObject(self, @selector(enableDirection), @(enableDirection), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (enableDirection) {
        
        [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    }
}
- (BOOL)enableDirection{

    NSNumber * number = objc_getAssociatedObject(self, _cmd);
    
    return number.integerValue;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *, id> *)change context:(void *)context {
    if ([change[@"new"] CGPointValue].y > [change[@"old"] CGPointValue].y  ) { // 向上滚动
        //        NSLog(@"up");
        self.direction = DirectionUp;
        
    } else if ([change[@"new"] CGPointValue].y < [change[@"old"] CGPointValue].y  ) { // 向下滚动
        //        NSLog(@"down");
        self.direction = DirectionDown;
    }
}

@end
