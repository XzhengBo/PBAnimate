//
//  PBAnimateView.m
//  PBAnimate
//
//  Created by xzheng on 15/10/20.
//  Copyright © 2015年 xzheng. All rights reserved.
//

#import "PBAnimateView.h"
@interface PBAnimateView()

@property(nonatomic)NSString * animateType;
@property(nonatomic)POPSpringAnimation *SpringAni;
@property(nonatomic)POPBasicAnimation *BasicAni;
@property(nonatomic)POPDecayAnimation *DecayAni;
@property(nonatomic)PBAnimationType animationType;

@end

@implementation PBAnimateView

#pragma mark 动画属性
-(PBAnimateView *(^)(float vaule))Bounciness{
    return ^(float vaule){
        if (vaule<20 && vaule>0 && self.animationType==SpringAnimation) {
            self.SpringAni.springBounciness = vaule;
        }
        else{
            self.SpringAni.springBounciness = 4;
        }
        return self;
    };
}
-(PBAnimateView *(^)(float vaule))Tension{
    return ^(float vaule){

        if (vaule<20 && vaule>0 && self.animationType==SpringAnimation) {
            self.SpringAni.dynamicsTension = vaule;
        }
        else{
            self.SpringAni.dynamicsTension = 4;
        }
        return self;
    };
}

-(PBAnimateView *(^)(float vaule))Friction{
    return ^(float vaule){
        if (self.animationType==SpringAnimation) {
            self.SpringAni.dynamicsFriction = vaule;
        }
        return self;
    };
}

-(PBAnimateView *(^)(float vaule))Mass{
    return ^(float vaule){
        self.SpringAni.dynamicsMass = vaule;
        return self;
    };
}
-(PBAnimateView *(^)(id vaule))To{
    return ^(id vaule){
        switch (self.animationType) {
            case SpringAnimation:
                self.SpringAni.toValue =vaule;
                break;
            case BasicAnimation:
                self.BasicAni.toValue =vaule;
                break;
            default:
                break;
        }
        
        return self;
    };
}

-(PBAnimateView *(^)(id vaule))From{
    return ^(id vaule){
        switch (self.animationType) {
            case SpringAnimation:
                self.SpringAni.fromValue =vaule;
                break;
            case BasicAnimation:
                self.BasicAni.fromValue =vaule;
                break;
            case DecayAnimation:
                self.DecayAni.fromValue =vaule;
                break;
            default:
                break;
        }
        
        return self;
    };
}

-(PBAnimateView *(^)(int vaule))RepeatCount{
    return ^(int vaule){
        switch (self.animationType) {
            case SpringAnimation:
                self.SpringAni.repeatCount=vaule;
                break;
            case BasicAnimation:
                self.BasicAni.repeatCount =vaule;
                break;
            case DecayAnimation:
                self.DecayAni.repeatCount =vaule;
                break;
            default:
                break;
        }
        
        return self;
    };
}
-(PBAnimateView *(^)(BOOL vaule))Autoreverses{
    return ^(BOOL vaule){
        switch (self.animationType) {
            case SpringAnimation:
                self.SpringAni.autoreverses=vaule;
                break;
            case BasicAnimation:
                self.BasicAni.autoreverses =vaule;
                break;
            case DecayAnimation:
                self.DecayAni.autoreverses =vaule;
                break;
            default:
                break;
        }
        
        return self;
    };
}

#pragma mark 动画类型
-(PBAnimateView *(^)(id vaule))Shake{
    return ^(id vaule){
        [self initPBAnimate:SpringAnimation];
        self.SpringAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
        if (vaule) {
            self.SpringAni.toValue=vaule;
        }
        else{
            self.SpringAni.toValue=[NSValue valueWithCGPoint:CGPointMake((self.frame.origin.x-50), 0)];
        }
        self.SpringAni.autoreverses=YES;
        self.animateType=@"shake";
        return self;
    };
}

-(PBAnimateView *(^)(id vaule))Pop{
    return ^(id vaule){
        [self initPBAnimate:SpringAnimation];
        self.SpringAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerSize];
        if (vaule) {
            self.SpringAni.toValue =vaule;
        }
        else{
          self.SpringAni.toValue =[NSValue valueWithCGSize:CGSizeMake((self.bounds.size.width)*2, (self.bounds.size.height)*2)];
        }
        self.SpringAni.autoreverses=YES;
        self.animateType=@"pop";
        return self;
    };
}

-(PBAnimateView *(^)(id vaule))Morph{
    return ^(id vaule){
        [self initPBAnimate:SpringAnimation];
        self.SpringAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerSize];
        if (vaule) {
            self.SpringAni.toValue =vaule;
        }else{
            self.SpringAni.toValue =[NSValue valueWithCGSize:CGSizeMake((self.bounds.size.width)*2, (self.bounds.size.height)*2)];
        }
        self.SpringAni.autoreverses=YES;
        self.animateType=@"pop";
        return self;
    };
}

-(PBAnimateView *(^)(id vaule))Bounce{
    return ^(id vaule){
        [self initPBAnimate:SpringAnimation];
        self.SpringAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
        if (vaule) {
            self.SpringAni.toValue =vaule;
        }
        else{
            self.SpringAni.toValue =[NSValue valueWithCGPoint:CGPointMake((self.frame.origin.y-20), 0)];
        }
        self.SpringAni.autoreverses=YES;
        self.animateType=@"bounce";
        return self;
    };
}

-(PBAnimateView *(^)(id vaule))Flash{
    return ^(id vaule){
        [self initPBAnimate:SpringAnimation];
        self.SpringAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        if (vaule) {
            self.SpringAni.toValue =vaule;
        }
        else{
            self.SpringAni.toValue =@(0);
        }
        
        self.SpringAni.autoreverses=YES;
        self.animateType=@"flash";
        return self;
    };
}

-(PBAnimateView *(^)(id vaule))Pulse{
    return ^(id vaule){
        [self initPBAnimate:SpringAnimation];
        self.SpringAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerSize];
        
        if (vaule) {
            self.SpringAni.toValue =vaule;
        }
        else{
           self.SpringAni.toValue =[NSValue valueWithCGSize:CGSizeMake((self.frame.size.width+30), (self.frame.size.height+30))];
        }
        
        self.SpringAni.autoreverses=YES;
        self.SpringAni.repeatCount=2;
        self.animateType=@"pluse";
        return self;
    };
}

-(PBAnimateView *(^)(id vaule))Rubber{
    return ^(id vaule){
        [self initPBAnimate:SpringAnimation];
        self.SpringAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerSize];
        
        if (vaule) {
            self.SpringAni.toValue =vaule;
        }
        else{
            self.SpringAni.toValue =[NSValue valueWithCGSize:CGSizeMake((self.frame.size.width+200), (self.frame.size.height-80))];

        }
        
        self.SpringAni.autoreverses=YES;
        self.animateType=@"pluse";
        return self;
    };
}

-(PBAnimateView *(^)(id vaule))Swing{
    return ^(id vaule){
        [self initPBAnimate:SpringAnimation];
        self.SpringAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerRotation];
        
        
        if (vaule) {
            self.SpringAni.toValue =vaule;
        }
        else{
            self.SpringAni.toValue =@(M_PI/2);
            
        }
        self.SpringAni.autoreverses=YES;
        self.animateType=@"swing";
        return self;
    };
}

-(PBAnimateView *(^)(id vaule))Tada{
    return ^(id vaule){
        [self initPBAnimate:SpringAnimation];
        self.SpringAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerBackgroundColor];
        
        
        if (vaule) {
            self.SpringAni.toValue =vaule;
        }
        else{
           self.SpringAni.toValue =[UIColor redColor];
            
        }
        
        self.SpringAni.autoreverses=YES;
        self.animateType=@"tada";
        return self;
    };
}

-(PBAnimateView *(^)(id vaule))CountDown{
    return ^(id vaule){
        POPAnimatableProperty *countdown = [POPAnimatableProperty propertyWithName:@"countdown" initializer:^(POPMutableAnimatableProperty *countdown) {
            countdown.writeBlock = ^(id obj, const CGFloat values[]) {
                UILabel *lable = (UILabel*)obj;
                lable.text = [NSString stringWithFormat:@"%02d:%02d:%02d",(int)values[0]/60,(int)values[0]%60,(int)(values[0]*100)%100];
            };
            
            //        prop.threshold = 0.01f;
        }];
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        self.BasicAni.property=countdown;
        self.BasicAni.fromValue=@(0);
        if (vaule) {
            self.BasicAni.toValue=vaule;
        }
        else{
            self.BasicAni.toValue=@(3*60);;
        }
        self.BasicAni.duration=3*60;
        self.BasicAni.beginTime=CACurrentMediaTime()+1.0f;
        self.animateType=@"countDown";
        
        return self;
    };
}

#pragma mark 封装基础动画
-(PBAnimateView *(^)(id vaule))fadeIn{
    return ^(id vaule){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.BasicAni.autoreverses=YES;
        if (vaule) {
            self.BasicAni.toValue =vaule;
        }
        else{
            self.BasicAni.toValue =@0;
        }
        self.animateType=@"fadeIn";
        return self;
    };
}
-(PBAnimateView *(^)(id vaule))fadeInDown{
    return ^(id vaule){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.BasicAni.autoreverses=YES;
        if (vaule) {
            self.BasicAni.toValue =vaule;
        }
        else{
            self.BasicAni.toValue =@0;
        }
        self.animateType=@"fadeIn";
        [self.layer pop_addAnimation:self.SpringAni forKey:self.animateType];
        
        return self;
    };
}
#pragma mark 动画事件

-(PBAnimateView *(^)(void))Play{
    
    return ^(void){
        
        switch (self.animationType) {
            case SpringAnimation:
                [self.layer pop_addAnimation:self.SpringAni forKey:self.animateType];
                break;
            case BasicAnimation:
                [self.layer pop_addAnimation:self.BasicAni forKey:self.animateType];
                break;
            case DecayAnimation:
                [self.layer pop_addAnimation:self.DecayAni forKey:self.animateType];
                break;
            default:
                break;
        }
        
        return self;
    };
    
}

-(PBAnimateView *(^)(void))Stop{
    return ^(void){
        [self.layer pop_removeAnimationForKey:self.animateType];
        return self;
    };
}

-(void)PBAnimateEndCallback:(PBAnimateCompletion)compblock{
    if (self.animationType==SpringAnimation) {
        self.SpringAni.completionBlock = ^(POPAnimation *anim, BOOL finished) {
            if (finished) {
                compblock();
            }
        };
    }
    if (self.animationType==BasicAnimation) {
        self.BasicAni.completionBlock = ^(POPAnimation *anim, BOOL finished) {
            if (finished) {
                compblock();
            }
        };
    }
    if (self.animationType==DecayAnimation) {
        self.DecayAni.completionBlock = ^(POPAnimation *anim, BOOL finished) {
            if (finished) {
                compblock();
            }
        };
    }
    
}

-(void)PBAnimateStartCallback:(PBAnimateCompletion)compblock{
    if (self.animationType==SpringAnimation) {
        self.SpringAni.animationDidStartBlock = ^(POPAnimation *anim) {
            compblock();
        };
    }
    if (self.animationType==BasicAnimation) {
        self.BasicAni.animationDidStartBlock = ^(POPAnimation *anim) {
            compblock();
        };
    }
    if (self.animationType==DecayAnimation) {
        self.DecayAni.animationDidStartBlock = ^(POPAnimation *anim) {
            compblock();
        };
    }
    
}

#pragma mark 拓展方法
-(void)initPBAnimate:(PBAnimationType)animationType{
    self.animationType=animationType;
    switch (animationType) {
        case BasicAnimation:
            self.BasicAni=[POPBasicAnimation animation];
//            self.BasicAni.delegate=self;
            break;
        case DecayAnimation:
            self.DecayAni=[POPDecayAnimation animation];
            break;
        case SpringAnimation:
            self.SpringAni=[POPSpringAnimation animation];
//            self.SpringAni.delegate=self;
            break;
        default:
            break;
    }
}



//#pragma mark Delegate
///**
// @abstract Called on animation start.
// @param anim The relevant animation.
// */
//- (void)pop_animationDidStart:(POPAnimation *)anim{
//     NSLog(@"pop_animationDidStart deldegate");
//}
//
///**
// @abstract Called when value meets or exceeds to value.
// @param anim The relevant animation.
// */
//- (void)pop_animationDidReachToValue:(POPAnimation *)anim{
//     NSLog(@"pop_animationDidReachToValue deldegate");
//}
//
///**
// @abstract Called on animation stop.
// @param anim The relevant animation.
// @param finished Flag indicating finished state. Flag is true if the animation reached completion before being removed.
// */
//- (void)pop_animationDidStop:(POPAnimation *)anim finished:(BOOL)finished{
//     NSLog(@"pop_animationDidStop deldegate");
//}
//
///**
// @abstract Called each frame animation is applied.
// @param anim The relevant animation.
// */
//- (void)pop_animationDidApply:(POPAnimation *)anim{
//     NSLog(@"pop_animationDidApply deldegate");
//}


@end


