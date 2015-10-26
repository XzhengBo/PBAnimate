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
-(PBAnimateView *(^)(float vaule))PBAnimateBounciness{
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
-(PBAnimateView *(^)(float vaule))PBAnimateTension{
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

-(PBAnimateView *(^)(float vaule))PBAnimateFriction{
    return ^(float vaule){
        if (self.animationType==SpringAnimation) {
            self.SpringAni.dynamicsFriction = vaule;
        }
        return self;
    };
}

-(PBAnimateView *(^)(float vaule))PBAnimateMass{
    return ^(float vaule){
        self.SpringAni.dynamicsMass = vaule;
        return self;
    };
}
-(PBAnimateView *(^)(id vaule))PBAnimateToValue{
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

-(PBAnimateView *(^)(id vaule))PBAnimateFromValue{
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

-(PBAnimateView *(^)(int vaule))PBAnimateRepeatCount{
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
-(PBAnimateView *(^)(BOOL vaule))PBAnimateAutoreverses{
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
-(PBAnimateView *(^)(id vaule))PBAnimateShake{
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

-(PBAnimateView *(^)(id vaule))PBAnimatePop{
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

-(PBAnimateView *(^)(id vaule))PBAnimatemorph{
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

-(PBAnimateView *(^)(id vaule))PBAnimateBounce{
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

-(PBAnimateView *(^)(id vaule))PBAnimateFlash{
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

-(PBAnimateView *(^)(id vaule))PBAnimatePulse{
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

-(PBAnimateView *(^)(id vaule))PBAnimateRubber{
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

-(PBAnimateView *(^)(id vaule))PBAnimateSwing{
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

-(PBAnimateView *(^)(id vaule))PBAnimateTada{
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

#pragma mark 动画事件
-(PBAnimateView *(^)(bool play))PBAnimate{
    return ^(bool play){
        if (play) {
          [self.layer pop_addAnimation:self.SpringAni forKey:self.animateType];
        }
        else{
            [self.layer pop_removeAnimationForKey:self.animateType];
        }
        return self;
    };
}

-(void)PBAnimateEndCallback:(PBAnimateCompletion)compblock{
    
    self.SpringAni.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            compblock();
        }
    };
    
}

#pragma mark 拓展方法
-(void)initPBAnimate:(PBAnimationType)animationType{
    self.animationType=animationType;
    switch (animationType) {
        case BasicAnimation:
            self.BasicAni=[POPBasicAnimation animation];
            break;
        case DecayAnimation:
            self.DecayAni=[POPDecayAnimation animation];
            break;
        case SpringAnimation:
            self.SpringAni=[POPSpringAnimation animation];
            break;
        default:
            break;
    }
}

@end
