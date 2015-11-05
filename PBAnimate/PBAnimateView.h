//
//  PBAnimateView.h
//  PBAnimate
//
//  Created by xzheng on 15/10/20.
//  Copyright © 2015年 xzheng. All rights reserved.
//
#import "PBAnimate.h"
#import <UIKit/UIKit.h>

typedef void(^PBAnimateCompletion)();

typedef NS_ENUM(NSInteger,PBAnimationType) {
    BasicAnimation,
    DecayAnimation,
    SpringAnimation
};

@interface PBAnimateView : UIView



#pragma mark 动画属性设置
/**
 *  设置反弹幅度
 */
@property(nonatomic,readonly) PBAnimateView *(^Bounciness)(float value);
/**
 * Tension 拉力－影响回弹力度以及速度
 */
@property(nonatomic,readonly) PBAnimateView *(^Tension)(float value);
/**
 *  Friction 摩擦力－如果开启，动画会不断重复，幅度逐渐削弱，直到停止
 */
@property(nonatomic,readonly) PBAnimateView *(^Friction)(float value);
/**
 *  设置质量－细微的影响动画的回弹力度以及速度
 */
@property(nonatomic,readonly) PBAnimateView *(^Mass)(float value);
/**
 *  设置POP动画放大Size
 */
@property(nonatomic,readonly) PBAnimateView *(^PopScaleSize)(float value);
/**
 *  设置ToValue值
 */
@property(nonatomic,readonly) PBAnimateView *(^To)(id value);
/**
 *  设置FromValue值
 */
@property(nonatomic,readonly) PBAnimateView *(^From)(id value);
/**
 *  设置动画重复几次
 */
@property(nonatomic,readonly) PBAnimateView *(^RepeatCount)(int value);
/**
 *  设置是否自动恢复
 */
@property(nonatomic,readonly) PBAnimateView *(^Autoreverses)(BOOL value);
/**
 *  设置动画持续时间
 */
@property(nonatomic,readonly) PBAnimateView *(^Duration)(BOOL value);
/**
 *  设置动画延迟
 */
@property(nonatomic,readonly) PBAnimateView *(^Delay)(float value);
/**
 *  永远循环播放
 */
@property(nonatomic,readonly) PBAnimateView *(^RepeatForever)(BOOL value);
/**
 *  播放完成移除
 */
@property(nonatomic,readonly) PBAnimateView *(^removedOnCompletion)(BOOL value);

#pragma mark 封装时间函数
@property(nonatomic,readonly) PBAnimateView *(^Linear)(void);
@property(nonatomic,readonly) PBAnimateView *(^EaseIn)(void);
@property(nonatomic,readonly) PBAnimateView *(^EaseOut)(void);
@property(nonatomic,readonly) PBAnimateView *(^EaseInEaseOut)(void);
@property(nonatomic,readonly) PBAnimateView *(^Bounce)(void);


#pragma mark 封装基础动画
#pragma mark FadeIn
@property(nonatomic,readonly) PBAnimateView *(^fadeIn)(void);
@property(nonatomic,readonly) PBAnimateView *(^fadeInDown)(void);
@property(nonatomic,readonly) PBAnimateView *(^fadeInLeft)(void);
@property(nonatomic,readonly) PBAnimateView *(^fadeInRight)(void);
@property(nonatomic,readonly) PBAnimateView *(^fadeInUp)(void);
#pragma mark FadeOut
@property(nonatomic,readonly) PBAnimateView *(^fadeOut)(void);
@property(nonatomic,readonly) PBAnimateView *(^fadeOutDown)(void);
@property(nonatomic,readonly) PBAnimateView *(^fadeOutLeft)(void);
@property(nonatomic,readonly) PBAnimateView *(^fadeOutRight)(void);
@property(nonatomic,readonly) PBAnimateView *(^fadeOutUp)(void);
#pragma mark SlideIn
@property(nonatomic,readonly) PBAnimateView *(^slideInDown)(void);
@property(nonatomic,readonly) PBAnimateView *(^slideInRight)(void);
@property(nonatomic,readonly) PBAnimateView *(^slideInLeft)(void);
@property(nonatomic,readonly) PBAnimateView *(^slideInUp)(void);
#pragma mark SlideOut
@property(nonatomic,readonly) PBAnimateView *(^slideOutDown)(void);
@property(nonatomic,readonly) PBAnimateView *(^slideOutUp)(void);
@property(nonatomic,readonly) PBAnimateView *(^slideOutRight)(void);
@property(nonatomic,readonly) PBAnimateView *(^slideOutLeft)(void);
#pragma mark RoateIn
@property(nonatomic,readonly) PBAnimateView *(^RoateIn)(void);
@property(nonatomic,readonly) PBAnimateView *(^RoateInDownLeft)(void);
@property(nonatomic,readonly) PBAnimateView *(^RoateInDownRight)(void);
@property(nonatomic,readonly) PBAnimateView *(^RoateInUpRight)(void);
@property(nonatomic,readonly) PBAnimateView *(^RoateInUpLeft)(void);
#pragma mark RoateOut
@property(nonatomic,readonly) PBAnimateView *(^RoateOut)(void);
@property(nonatomic,readonly) PBAnimateView *(^RoateOutDownLeft)(void);
@property(nonatomic,readonly) PBAnimateView *(^RoateOutDownRight)(void);
@property(nonatomic,readonly) PBAnimateView *(^RoateOutUpRight)(void);
@property(nonatomic,readonly) PBAnimateView *(^RoateOutUpLeft)(void);

#pragma mark Flip
@property(nonatomic,readonly) PBAnimateView *(^flipX)(void);
@property(nonatomic,readonly) PBAnimateView *(^flipY)(void);
@property(nonatomic,readonly) PBAnimateView *(^flipXOut)(void);
@property(nonatomic,readonly) PBAnimateView *(^flipYOut)(void);
#pragma mark Bounce


#pragma mark 动画事件
/**
 *  是否开始动画，参数YES/NO
 */
@property(nonatomic,readonly) PBAnimateView *(^Play)(void);

@property(nonatomic,readonly) PBAnimateView *(^Stop)(void);

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

