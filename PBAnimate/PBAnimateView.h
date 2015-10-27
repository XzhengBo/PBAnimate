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
@property(nonatomic,readonly) PBAnimateView *(^Bounciness)(float vaule);
/**
 * Tension 拉力－影响回弹力度以及速度
 */
@property(nonatomic,readonly) PBAnimateView *(^Tension)(float vaule);
/**
 *  Friction 摩擦力－如果开启，动画会不断重复，幅度逐渐削弱，直到停止
 */
@property(nonatomic,readonly) PBAnimateView *(^Friction)(float vaule);
/**
 *  设置质量－细微的影响动画的回弹力度以及速度
 */
@property(nonatomic,readonly) PBAnimateView *(^Mass)(float vaule);
/**
 *  设置POP动画放大Size
 */
@property(nonatomic,readonly) PBAnimateView *(^PopScaleSize)(float vaule);
/**
 *  设置ToValue值
 */
@property(nonatomic,readonly) PBAnimateView *(^To)(id vaule);
/**
 *  设置FromValue值
 */
@property(nonatomic,readonly) PBAnimateView *(^From)(id vaule);
/**
 *  设置动画重复几次
 */
@property(nonatomic,readonly) PBAnimateView *(^RepeatCount)(int vaule);
/**
 *  设置是否自动恢复
 */
@property(nonatomic,readonly) PBAnimateView *(^Autoreverses)(BOOL vaule);


//
//#pragma mark 动画类型
///**
// *  Shake动画，参数：X轴位置，默认：原位置-50
// */
@property(nonatomic,readonly) PBAnimateView *(^Shake)(id vaule);
///**
// *  POP动画，参数：放大bounds，默认：放大2倍
// */
//@property(nonatomic,readonly) PBAnimateView *(^Pop)(id vaule);
///**
// *  Bounce动画，参数：Y轴移动位置，默认：原位置-20
// */
//@property(nonatomic,readonly) PBAnimateView *(^Bounce)(id vaule);
///**
// *  flash动画，参数：透明度，默认：0
// */
//@property(nonatomic,readonly) PBAnimateView *(^Flash)(id vaule);
///**
// *  pluse动画，参数：放大bounds，默认：bounds+30
// */
//@property(nonatomic,readonly) PBAnimateView *(^Pulse)(id vaule);
///**
// *  设置Rubber动画，参数速度，范围：0~20
// */
//@property(nonatomic,readonly) PBAnimateView *(^Rubber)(id vaule);
//
//@property(nonatomic,readonly) PBAnimateView *(^Swing)(id vaule);
//
//@property(nonatomic,readonly) PBAnimateView *(^Tada)(id vaule);
//
//@property(nonatomic,readonly) PBAnimateView *(^CountDown)(id vaule);
//

#pragma mark 封装基础动画
#pragma mark FadeIn
@property(nonatomic,readonly) PBAnimateView *(^fadeIn)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^fadeInDown)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^fadeInLeft)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^fadeInRight)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^fadeInUp)(id vaule);
#pragma mark FadeOut
@property(nonatomic,readonly) PBAnimateView *(^fadeOut)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^fadeOutDown)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^fadeOutLeft)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^fadeOutRight)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^fadeOutUp)(id vaule);
#pragma mark SlideIn
@property(nonatomic,readonly) PBAnimateView *(^slideInDown)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^slideInRight)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^slideInLeft)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^slideInUp)(id vaule);
#pragma mark SlideOut
@property(nonatomic,readonly) PBAnimateView *(^slideOutDown)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^slideOutUp)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^slideOutRight)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^slideOutLeft)(id vaule);
#pragma mark RoateIn
@property(nonatomic,readonly) PBAnimateView *(^RoateIn)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^RoateInDownLeft)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^RoateInDownRight)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^RoateInUpRight)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^RoateInUpLeft)(id vaule);
#pragma mark RoateOut
@property(nonatomic,readonly) PBAnimateView *(^RoateOut)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^RoateOutDownLeft)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^RoateOutDownRight)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^RoateOutUpRight)(id vaule);
@property(nonatomic,readonly) PBAnimateView *(^RoateOutUpLeft)(id vaule);

#pragma mark Flip

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

