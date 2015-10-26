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
@property(nonatomic,readonly) PBAnimateView *(^PBAnimateBounciness)(float vaule);
/**
 * Tension 拉力－影响回弹力度以及速度
 */
@property(nonatomic,readonly) PBAnimateView *(^PBAnimateTension)(float vaule);
/**
 *  Friction 摩擦力－如果开启，动画会不断重复，幅度逐渐削弱，直到停止
 */
@property(nonatomic,readonly) PBAnimateView *(^PBAnimateFriction)(float vaule);
/**
 *  设置质量－细微的影响动画的回弹力度以及速度
 */
@property(nonatomic,readonly) PBAnimateView *(^PBAnimateMass)(float vaule);
/**
 *  设置POP动画放大Size
 */
@property(nonatomic,readonly) PBAnimateView *(^PBAnimatePopScaleSize)(float vaule);
/**
 *  设置ToValue值
 */
@property(nonatomic,readonly) PBAnimateView *(^PBAnimateToValue)(id vaule);
/**
 *  设置FromValue值
 */
@property(nonatomic,readonly) PBAnimateView *(^PBAnimateFromValue)(id vaule);
/**
 *  设置动画重复几次
 */
@property(nonatomic,readonly) PBAnimateView *(^PBAnimateRepeatCount)(int vaule);
/**
 *  设置是否自动恢复
 */
@property(nonatomic,readonly) PBAnimateView *(^PBAnimateAutoreverses)(BOOL vaule);
#pragma mark 动画类型
/**
 *  Shake动画，参数：X轴位置，默认：原位置-50
 */
@property(nonatomic,readonly) PBAnimateView *(^PBAnimateShake)(id vaule);
/**
 *  POP动画，参数：放大bounds，默认：放大2倍
 */
@property(nonatomic,readonly) PBAnimateView *(^PBAnimatePop)(id vaule);
/**
 *  Bounce动画，参数：Y轴移动位置，默认：原位置-20
 */
@property(nonatomic,readonly) PBAnimateView *(^PBAnimateBounce)(id vaule);
/**
 *  flash动画，参数：透明度，默认：0
 */
@property(nonatomic,readonly) PBAnimateView *(^PBAnimateFlash)(id vaule);
/**
 *  pluse动画，参数：放大bounds，默认：bounds+30
 */
@property(nonatomic,readonly) PBAnimateView *(^PBAnimatePulse)(id vaule);
/**
 *  设置Rubber动画，参数速度，范围：0~20
 */
@property(nonatomic,readonly) PBAnimateView *(^PBAnimateRubber)(id vaule);

@property(nonatomic,readonly) PBAnimateView *(^PBAnimateSwing)(id vaule);

@property(nonatomic,readonly) PBAnimateView *(^PBAnimateTada)(id vaule);

#pragma mark 动画事件
/**
 *  是否开始动画，参数YES/NO
 */
@property(nonatomic,readonly) PBAnimateView *(^PBAnimate)(bool play);

/**
 *  动画结束回调
 *
 *  @param compblock 回调方法
 */
-(void) PBAnimateEndCallback:(PBAnimateCompletion) compblock;


@end
