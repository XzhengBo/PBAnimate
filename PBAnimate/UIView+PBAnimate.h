//
//  UIView+PBAnimate.h
//  PBAnimate
//
//  Created by xzheng on 15/10/15.
//  Copyright © 2015年 xzheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PBAnimate.h"

@interface UIView(PBAnimate)


@property(nonatomic,readonly) UIView *(^PBAnimateType)(NSString* Animationkey);


/**
 *  停止所有动画
 *
 *  @return
 */
-(UIView *) PBAnimateStopAll;


@end
