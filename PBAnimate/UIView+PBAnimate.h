//
//  UIView+PBAnimate.h
//  PBAnimate
//
//  Created by xzheng on 15/10/15.
//  Copyright © 2015年 xzheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PBAnimate.h"
typedef void(^PBAnimateCompletion)();

typedef NS_ENUM(NSInteger,PBAnimationType) {
    BasicAnimation,
    DecayAnimation,
    SpringAnimation
};

@interface UIView(PBAnimate)


#pragma mark 动画属性设置
/**
 *  设置反弹幅度
 */
@property(nonatomic,readonly) UIView *(^Bounciness)(float value);
/**
 * Tension 拉力－影响回弹力度以及速度
 */
@property(nonatomic,readonly) UIView *(^Tension)(float value);
/**
 *  Friction 摩擦力－如果开启，动画会不断重复，幅度逐渐削弱，直到停止
 */
@property(nonatomic,readonly) UIView *(^Friction)(float value);
/**
 *  设置质量－细微的影响动画的回弹力度以及速度
 */
@property(nonatomic,readonly) UIView *(^Mass)(float value);
/**
 *  设置POP动画放大Size
 */
@property(nonatomic,readonly) UIView *(^PopScaleSize)(float value);
/**
 *  设置ToValue值
 */
@property(nonatomic,readonly) UIView *(^To)(id value);
/**
 *  设置FromValue值
 */
@property(nonatomic,readonly) UIView *(^From)(id value);
/**
 *  设置动画重复几次
 */
@property(nonatomic,readonly) UIView *(^RepeatCount)(int value);
/**
 *  设置是否自动恢复
 */
@property(nonatomic,readonly) UIView *(^Autoreverses)(BOOL value);
/**
 *  设置动画持续时间
 */
@property(nonatomic,readonly) UIView *(^Duration)(BOOL value);
/**
 *  设置动画延迟
 */
@property(nonatomic,readonly) UIView *(^Delay)(float value);
/**
 *  永远循环播放
 */
@property(nonatomic,readonly) UIView *(^RepeatForever)(BOOL value);
/**
 *  播放完成移除
 */
@property(nonatomic,readonly) UIView *(^removedOnCompletion)(BOOL value);

#pragma mark 封装时间函数
@property(nonatomic,readonly) UIView *(^Linear)(void);
@property(nonatomic,readonly) UIView *(^EaseIn)(void);
@property(nonatomic,readonly) UIView *(^EaseOut)(void);
@property(nonatomic,readonly) UIView *(^EaseInEaseOut)(void);
@property(nonatomic,readonly) UIView *(^Bounce)(void);


#pragma mark 封装基础动画
#pragma mark FadeIn
@property(nonatomic,readonly) UIView *(^fadeIn)(void);
@property(nonatomic,readonly) UIView *(^fadeInDown)(void);
@property(nonatomic,readonly) UIView *(^fadeInLeft)(void);
@property(nonatomic,readonly) UIView *(^fadeInRight)(void);
@property(nonatomic,readonly) UIView *(^fadeInUp)(void);
#pragma mark FadeOut
@property(nonatomic,readonly) UIView *(^fadeOut)(void);
@property(nonatomic,readonly) UIView *(^fadeOutDown)(void);
@property(nonatomic,readonly) UIView *(^fadeOutLeft)(void);
@property(nonatomic,readonly) UIView *(^fadeOutRight)(void);
@property(nonatomic,readonly) UIView *(^fadeOutUp)(void);
#pragma mark SlideIn
@property(nonatomic,readonly) UIView *(^slideInDown)(void);
@property(nonatomic,readonly) UIView *(^slideInRight)(void);
@property(nonatomic,readonly) UIView *(^slideInLeft)(void);
@property(nonatomic,readonly) UIView *(^slideInUp)(void);
#pragma mark SlideOut
@property(nonatomic,readonly) UIView *(^slideOutDown)(void);
@property(nonatomic,readonly) UIView *(^slideOutUp)(void);
@property(nonatomic,readonly) UIView *(^slideOutRight)(void);
@property(nonatomic,readonly) UIView *(^slideOutLeft)(void);
#pragma mark RoateIn
@property(nonatomic,readonly) UIView *(^RoateIn)(void);
@property(nonatomic,readonly) UIView *(^RoateInDownLeft)(void);
@property(nonatomic,readonly) UIView *(^RoateInDownRight)(void);
@property(nonatomic,readonly) UIView *(^RoateInUpRight)(void);
@property(nonatomic,readonly) UIView *(^RoateInUpLeft)(void);
#pragma mark RoateOut
@property(nonatomic,readonly) UIView *(^RoateOut)(void);
@property(nonatomic,readonly) UIView *(^RoateOutDownLeft)(void);
@property(nonatomic,readonly) UIView *(^RoateOutDownRight)(void);
@property(nonatomic,readonly) UIView *(^RoateOutUpRight)(void);
@property(nonatomic,readonly) UIView *(^RoateOutUpLeft)(void);

#pragma mark Flip
@property(nonatomic,readonly) UIView *(^flipX)(void);
@property(nonatomic,readonly) UIView *(^flipY)(void);
@property(nonatomic,readonly) UIView *(^flipXOut)(void);
@property(nonatomic,readonly) UIView *(^flipYOut)(void);
#pragma mark Bounce


#pragma mark 动画事件
/**
 *  是否开始动画，参数YES/NO
 */
@property(nonatomic,readonly) UIView *(^Play)(void);

@property(nonatomic,readonly) UIView *(^Stop)(void);

/**
 *  动画结束
 *
 *  @param compblock 回调方法
 */
-(void) PBAnimateEndCallback:(PBAnimateCompletion) compblock;
/**
 *  动画开始
 *
 *  @param compblock 回调方法
 */
-(void) PBAnimateStartCallback:(PBAnimateCompletion) compblock;



@end
