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
@property(nonatomic,readonly) PBAnimateView *(^PBAnimatetoValue)(id vaule);

#pragma mark 动画类型

@property(nonatomic,readonly) PBAnimateView *(^PBAnimateShake)(float speed);

@property(nonatomic,readonly) PBAnimateView *(^PBAnimatePop)(float speed);
/**
 *  设置Bounce动画，参数速度，范围：0~20
 */
@property(nonatomic,readonly) PBAnimateView *(^PBAnimateBounce)(float speed);
/**
 *  设置flash动画，参数速度，范围：0~20
 */
@property(nonatomic,readonly) PBAnimateView *(^PBAnimateFlash)(float speed);
/**
 *  设置pluse动画，参数速度，范围：0~20
 */
@property(nonatomic,readonly) PBAnimateView *(^PBAnimatePulse)(float speed);
/**
 *  设置Rubber动画，参数速度，范围：0~20
 */
@property(nonatomic,readonly) PBAnimateView *(^PBAnimateRubber)(float speed);
@property(nonatomic,readonly) PBAnimateView *(^PBAnimateSwing)(float speed);
@property(nonatomic,readonly) PBAnimateView *(^PBAnimateTada)(float speed);

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
