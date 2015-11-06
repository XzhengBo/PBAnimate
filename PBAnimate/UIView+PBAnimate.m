//
//  UIView+PBAnimate.m
//  PBAnimate
//
//  Created by xzheng on 15/10/15.
//  Copyright © 2015年 xzheng. All rights reserved.
//

#import "UIView+PBAnimate.h"
NSString * animateType_tmp;
NSString * HelpAnimateType_tmp;
POPSpringAnimation *SpringAni_tmp;
POPBasicAnimation *BasicAni_tmp;
POPDecayAnimation *DecayAni_tmp;
POPSpringAnimation *HelpSpringAni_tmp;
POPBasicAnimation *HelpBasicAni_tmp;
POPDecayAnimation *HelpDecayAni_tmp;
PBAnimationType animationType_tmp;
CGRect initSize_tmp;
BOOL needrecoveryFrame_tmp;
BOOL isPlaying_tmp;

@interface UIView(PBAnimate)

@property(nonatomic)NSString * animateType;
@property(nonatomic)NSString * HelpAnimateType;

@property(nonatomic)POPSpringAnimation *SpringAni;
@property(nonatomic)POPBasicAnimation *BasicAni;
@property(nonatomic)POPDecayAnimation *DecayAni;

@property(nonatomic)POPSpringAnimation *HelpSpringAni;
@property(nonatomic)POPBasicAnimation *HelpBasicAni;
@property(nonatomic)POPDecayAnimation *HelpDecayAni;

@property(nonatomic)PBAnimationType animationType;
@property(nonatomic)CGRect initSize;
@property(nonatomic)BOOL needrecoveryFrame;
@property(nonatomic)BOOL isPlaying;
@end


@implementation UIView(PBAnimate)

#pragma mark 动画属性

-(UIView *(^)(float value))Tension{
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

-(UIView *(^)(float value))Friction{
    return ^(float vaule){
        if (self.animationType==SpringAnimation) {
            self.SpringAni.dynamicsFriction = vaule;
        }
        return self;
    };
}

-(UIView *(^)(float value))Mass{
    return ^(float vaule){
        self.SpringAni.dynamicsMass = vaule;
        return self;
    };
}
-(UIView *(^)(id value))To{
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

-(UIView *(^)(id value))From{
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

-(UIView *(^)(int value))RepeatCount{
    return ^(int vaule){
        switch (self.animationType) {
            case SpringAnimation:
                self.SpringAni.repeatCount=vaule;
                break;
            case BasicAnimation:
                self.BasicAni.repeatCount =vaule;
                self.HelpBasicAni.repeatCount=vaule;
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
-(UIView *(^)(BOOL value))Autoreverses{
    return ^(BOOL vaule){
        switch (self.animationType) {
            case SpringAnimation:
                self.SpringAni.autoreverses=vaule;
                
                break;
            case BasicAnimation:
                self.BasicAni.autoreverses =vaule;
                self.HelpBasicAni.autoreverses=vaule;
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
-(UIView *(^)(BOOL value))Duration{
    return ^(BOOL vaule){
        switch (self.animationType) {
            case BasicAnimation:
                self.BasicAni.duration =vaule;
                self.HelpBasicAni.duration=vaule;
                break;
            default:
                break;
        }
        return self;
    };
}
-(UIView *(^)(float value))Delay{
    return ^(float vaule){
        switch (self.animationType) {
            case BasicAnimation:
                self.BasicAni.beginTime=CACurrentMediaTime()+vaule;
                self.HelpBasicAni.beginTime=CACurrentMediaTime()+vaule;
                break;
            default:
                break;
        }
        return self;
    };
}

-(UIView *(^)(BOOL value))repeatForever{
    return ^(BOOL vaule){
        switch (self.animationType) {
            case BasicAnimation:
                self.BasicAni.repeatForever=vaule;
                self.HelpBasicAni.repeatForever=vaule;
                break;
            default:
                break;
        }
        return self;
    };
}

-(UIView *(^)(BOOL value))removedOnCompletion{
    return ^(BOOL vaule){
        switch (self.animationType) {
            case BasicAnimation:
                self.BasicAni.removedOnCompletion=vaule;
                self.HelpBasicAni.removedOnCompletion=vaule;
                break;
            default:
                break;
        }
        return self;
    };
}
#pragma mark 封装动画时间函数

-(UIView *(^)(void))Linear{
    return ^(void){
        switch (self.animationType) {
            case BasicAnimation:
                self.BasicAni.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
                self.HelpBasicAni.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
                break;
            default:
                break;
        }
        return self;
    };
}

-(UIView *(^)(void))EaseIn{
    return ^(void){
        switch (self.animationType) {
            case BasicAnimation:
                self.BasicAni.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
                self.HelpBasicAni.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
                break;
            default:
                break;
        }
        return self;
    };
}

-(UIView *(^)(void))EaseOut{
    return ^(void){
        switch (self.animationType) {
            case BasicAnimation:
                self.BasicAni.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
                self.HelpBasicAni.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
                break;
            default:
                break;
        }
        return self;
    };
}

-(UIView *(^)(void))EaseInEaseOut{
    return ^(void){
        switch (self.animationType) {
            case BasicAnimation:
                self.BasicAni.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                self.HelpBasicAni.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                break;
            default:
                break;
        }
        return self;
    };
}
//TODO: Bounce完善
-(UIView *(^)(float value))Bounce{
  
    return ^(float vaule){
        [self initPBAnimate:SpringAnimation];
//!!!: SlideIn
        if ([self.animateType isEqualToString:@"slideInDown"]) {
            self.SpringAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
            self.SpringAni.fromValue=[NSNumber numberWithFloat:-300];
            self.SpringAni.toValue=[NSNumber numberWithFloat:self.initSize.origin.y+self.initSize.size.height/2];
      
        }
        if ([self.animateType isEqualToString:@"slideInUp"]){
            self.SpringAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
            self.SpringAni.fromValue=[NSNumber numberWithFloat:self.frame.origin.y-200];
            self.SpringAni.toValue=[NSNumber numberWithFloat:self.initSize.origin.y+self.initSize.size.height/2];

        }
        if ([self.animateType isEqualToString:@"slideInLeft"]){

            self.SpringAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
            self.SpringAni.fromValue=[NSNumber numberWithFloat:self.frame.origin.x-200];
            self.SpringAni.toValue=[NSNumber numberWithFloat:self.initSize.origin.x+self.initSize.size.width/2];
     
        }
        if ([self.animateType isEqualToString:@"slideInRight"]){
            self.SpringAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
            self.SpringAni.fromValue=[NSNumber numberWithFloat:self.frame.origin.x+200];
            self.SpringAni.toValue=[NSNumber numberWithFloat:self.initSize.origin.x+self.initSize.size.width/2];

        }
//!!!: SlideOut
        if ([self.animateType isEqualToString:@"slideOutDown"]) {
            self.SpringAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
            self.SpringAni.toValue=[NSNumber numberWithFloat:self.frame.origin.y+200];
            self.SpringAni.fromValue=[NSNumber numberWithFloat:self.initSize.origin.y+self.initSize.size.height/2];
        }
        if ([self.animateType isEqualToString:@"slideOutUp"]) {
            self.SpringAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
            self.SpringAni.toValue=[NSNumber numberWithFloat:self.frame.origin.y-200];
            self.SpringAni.fromValue=[NSNumber numberWithFloat:self.initSize.origin.y+self.initSize.size.height/2];
        }
        if ([self.animateType isEqualToString:@"slideOutRight"]) {
            self.SpringAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
            self.SpringAni.toValue=[NSNumber numberWithFloat:self.window.bounds.size.width+self.frame.size.width];
            self.SpringAni.fromValue=[NSNumber numberWithFloat:self.initSize.origin.x+self.initSize.size.width/2];
        }
        if ([self.animateType isEqualToString:@"slideOutLeft"]) {
            self.SpringAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
            self.SpringAni.toValue=[NSNumber numberWithFloat:self.frame.origin.x-200];
            self.SpringAni.fromValue=[NSNumber numberWithFloat:self.initSize.origin.x+self.initSize.size.width/2];
            
        }
        self.SpringAni.springBounciness = vaule;
        return self;
    };
}


#pragma mark 封装基础动画
-(UIView *(^)(void))fadeIn{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.BasicAni.fromValue =@0;
        self.BasicAni.toValue =@1;
        self.animateType=@"fadeIn";
        return self;
    };
}
-(UIView *(^)(void))fadeInDown{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
        self.BasicAni.fromValue=[NSNumber numberWithFloat:self.frame.origin.y+200];
        self.BasicAni.toValue=[NSNumber numberWithFloat:self.initSize.origin.y+self.initSize.size.height/2];
        self.animateType=@"FadeInDown";
        
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@0;
        self.HelpBasicAni.toValue=@1;
        self.HelpAnimateType=@"FadeInDown_help";
        return self;
    };
}

-(UIView *(^)(void))fadeInLeft{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
        self.BasicAni.fromValue=[NSNumber numberWithFloat:self.frame.origin.x-200];
        self.BasicAni.toValue=[NSNumber numberWithFloat:self.initSize.origin.x+self.initSize.size.width/2];
        self.animateType=@"fadeInLeft";
        
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@0;
        self.HelpBasicAni.toValue=@1;
        self.HelpAnimateType=@"fadeInLeft_help";
        return self;
    };
}

-(UIView *(^)(void))fadeInRight{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
        self.BasicAni.fromValue=[NSNumber numberWithFloat:self.frame.origin.x+200];
        self.BasicAni.toValue=[NSNumber numberWithFloat:self.initSize.origin.x+self.initSize.size.width/2];
        self.animateType=@"fadeInRight";
        
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@0;
        self.HelpBasicAni.toValue=@1;
        self.HelpAnimateType=@"fadeInRight_help";
        return self;
    };
}

-(UIView *(^)(void))fadeInUp{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
        self.BasicAni.fromValue=[NSNumber numberWithFloat:self.frame.origin.y-200];
        self.BasicAni.toValue=[NSNumber numberWithFloat:self.initSize.origin.y+self.initSize.size.height/2];
        self.animateType=@"fadeInUp";
        
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@0;
        self.HelpBasicAni.toValue=@1;
        self.HelpAnimateType=@"fadeInUp_help";
        return self;
    };
}


-(UIView *(^)(void))fadeOut{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.BasicAni.fromValue =@1;
        self.BasicAni.toValue =@0;
        self.animateType=@"fadeOut";
        return self;
    };
}

-(UIView *(^)(void))fadeOutDown{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
        self.BasicAni.toValue=[NSNumber numberWithFloat:self.frame.origin.y+200];
        self.BasicAni.fromValue=[NSNumber numberWithFloat:self.initSize.origin.y+self.initSize.size.height/2];
        self.animateType=@"fadeOutDown";
        
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@1;
        self.HelpBasicAni.toValue=@0;
        self.HelpAnimateType=@"fadeOutDown_help";
        return self;
    };
}

-(UIView *(^)(void))fadeOutLeft{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
        self.BasicAni.toValue=[NSNumber numberWithFloat:self.frame.origin.x-200];
        self.BasicAni.fromValue=[NSNumber numberWithFloat:self.initSize.origin.x+self.initSize.size.width/2];
        self.animateType=@"fadeOutLeft";
        
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@1;
        self.HelpBasicAni.toValue=@0;
        self.HelpAnimateType=@"fadeOutLeft_help";
        return self;
    };
}

-(UIView *(^)(void))fadeOutRight{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
        self.BasicAni.toValue=[NSNumber numberWithFloat:self.window.bounds.size.width+self.frame.size.width];
        self.BasicAni.fromValue=[NSNumber numberWithFloat:self.initSize.origin.x+self.initSize.size.width/2];
        self.animateType=@"fadeOutRight";
        
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@1;
        self.HelpBasicAni.toValue=@0;
        self.HelpAnimateType=@"fadeOutRight_help";
        return self;
    };
}

-(UIView *(^)(void))fadeOutUp{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
        self.BasicAni.toValue=[NSNumber numberWithFloat:self.frame.origin.y-200];
        self.BasicAni.fromValue=[NSNumber numberWithFloat:self.initSize.origin.y+self.initSize.size.height/2];
        self.animateType=@"fadeOutUp";
        
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@1;
        self.HelpBasicAni.toValue=@0;
        self.HelpAnimateType=@"fadeOutUp_help";
        return self;
    };
}

-(UIView *(^)(void))RoateIn{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerRotation];
        self.BasicAni.toValue=@(M_PI*2);;
        self.animateType=@"RoateIn";
        self.needrecoveryFrame=NO;
        self.BasicAni.completionBlock=^(POPAnimation *anim, BOOL finished) {
            if (finished) {
                self.layer.anchorPoint=CGPointMake(0.5, 0.5);
                self.frame=self.initSize;
            }
        };
        
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@0;
        self.HelpBasicAni.toValue=@1;
        self.HelpAnimateType=@"RoateIn_help";
        return self;
    };
}


-(UIView *(^)(void))RoateInDownLeft{
    return ^(void){
        
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerRotation];
        self.BasicAni.fromValue=@(-M_PI/2);;
        self.BasicAni.toValue=@(0);
        self.needrecoveryFrame=NO;
        self.frame=CGRectMake((self.frame.origin.x-self.frame.size.width*0.5), (self.frame.origin.y+self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
        self.layer.anchorPoint=CGPointMake(0, 1);
        self.animateType=@"RoateInDownLeft";
        
        self.BasicAni.completionBlock=^(POPAnimation *anim, BOOL finished) {
            if (finished) {
                self.layer.anchorPoint=CGPointMake(0.5, 0.5);
                self.frame=CGRectMake((self.frame.origin.x+self.frame.size.width*0.5), (self.frame.origin.y-self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
            }
        };
        
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@0;
        self.HelpBasicAni.toValue=@1;
        self.HelpAnimateType=@"RoateInDownLeft_help";
        
        return self;
    };
}

-(UIView *(^)(void))RoateInDownRight{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerRotation];
        self.BasicAni.fromValue=@(M_PI/2);;
        self.BasicAni.toValue=@(0);;
        self.frame=CGRectMake((self.frame.origin.x+self.frame.size.width*0.5), (self.frame.origin.y+self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
        self.layer.anchorPoint=CGPointMake(1, 1);;
        self.animateType=@"RoateInDownRight";
        self.needrecoveryFrame=NO;
        self.BasicAni.completionBlock=^(POPAnimation *anim, BOOL finished) {
            if (finished) {
                self.layer.anchorPoint=CGPointMake(0.5, 0.5);
                self.frame=CGRectMake((self.frame.origin.x-self.frame.size.width*0.5), (self.frame.origin.y-self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
            }
        };
        
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@0;
        self.HelpBasicAni.toValue=@1;
        self.HelpAnimateType=@"RoateInDownRight_help";
        return self;
    };
}

-(UIView *(^)(void))RoateInUpLeft{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerRotation];
        self.BasicAni.fromValue=@(-M_PI/2);
        self.BasicAni.toValue=@(0);
        self.frame=CGRectMake((self.frame.origin.x-self.frame.size.width*0.5), (self.frame.origin.y-self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
        self.layer.anchorPoint=CGPointMake(0, 0);;
        self.animateType=@"RoateInUpLeft";
        self.needrecoveryFrame=NO;
        self.BasicAni.completionBlock=^(POPAnimation *anim, BOOL finished) {
            if (finished) {
                self.layer.anchorPoint=CGPointMake(0.5, 0.5);
                self.frame=CGRectMake((self.frame.origin.x+self.frame.size.width*0.5), (self.frame.origin.y+self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
            }
        };
        
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@0;
        self.HelpBasicAni.toValue=@1;
        self.HelpAnimateType=@"RoateInUpLeft_help";
        return self;
    };
}

-(UIView *(^)(void))RoateInUpRight{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerRotation];
        self.BasicAni.fromValue=@(M_PI/2);
        self.BasicAni.toValue=@(0);
        self.frame=CGRectMake((self.frame.origin.x+self.frame.size.width*0.5), (self.frame.origin.y-self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
        self.layer.anchorPoint=CGPointMake(1, 0);;
        self.animateType=@"RoateInUpRight";
        self.needrecoveryFrame=NO;
        self.BasicAni.completionBlock=^(POPAnimation *anim, BOOL finished) {
            if (finished) {
                self.layer.anchorPoint=CGPointMake(0.5, 0.5);
                self.frame=CGRectMake((self.frame.origin.x-self.frame.size.width*0.5), (self.frame.origin.y+self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
            }
        };
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@0;
        self.HelpBasicAni.toValue=@1;
        self.HelpAnimateType=@"RoateInUpRight_help";
        return self;
    };
}
-(UIView *(^)(void))RoateOut{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerRotation];
        self.BasicAni.toValue=@(M_PI*2);;
        self.animateType=@"RoateOut";
        
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@1;
        self.HelpBasicAni.toValue=@0;
        self.HelpAnimateType=@"RoateOut_help";
        return self;
    };
}
-(UIView *(^)(void))RoateOutDownLeft{
    return ^(void){
        
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerRotation];
        self.BasicAni.fromValue=@(-M_PI/2);;
        self.BasicAni.toValue=@(0);
        self.needrecoveryFrame=NO;
        self.frame=CGRectMake((self.frame.origin.x-self.frame.size.width*0.5), (self.frame.origin.y+self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
        self.layer.anchorPoint=CGPointMake(0, 1);
        self.animateType=@"RoateOutDownLeft";
        
        self.BasicAni.completionBlock=^(POPAnimation *anim, BOOL finished) {
            if (finished) {
                self.layer.anchorPoint=CGPointMake(0.5, 0.5);
                self.frame=CGRectMake((self.frame.origin.x+self.frame.size.width*0.5), (self.frame.origin.y-self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
            }
        };
        
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@1;
        self.HelpBasicAni.toValue=@0;
        self.HelpAnimateType=@"RoateOutDownLeft_help";
        
        return self;
    };
}

-(UIView *(^)(void))RoateOutDownRight{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerRotation];
        self.BasicAni.fromValue=@(M_PI/2);;
        self.BasicAni.toValue=@(0);;
        self.frame=CGRectMake((self.frame.origin.x+self.frame.size.width*0.5), (self.frame.origin.y+self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
        self.layer.anchorPoint=CGPointMake(1, 1);;
        self.animateType=@"RoateOutDownRight";
        self.needrecoveryFrame=NO;
        self.BasicAni.completionBlock=^(POPAnimation *anim, BOOL finished) {
            if (finished) {
                self.layer.anchorPoint=CGPointMake(0.5, 0.5);
                self.frame=CGRectMake((self.frame.origin.x-self.frame.size.width*0.5), (self.frame.origin.y-self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
            }
        };
        
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@1;
        self.HelpBasicAni.toValue=@0;
        self.HelpAnimateType=@"RoateOutDownRight_help";
        return self;
    };
}

-(UIView *(^)(void))RoateOutUpLeft{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerRotation];
        self.BasicAni.fromValue=@(-M_PI/2);
        self.BasicAni.toValue=@(0);
        self.frame=CGRectMake((self.frame.origin.x-self.frame.size.width*0.5), (self.frame.origin.y-self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
        self.layer.anchorPoint=CGPointMake(0, 0);;
        self.animateType=@"RoateOutUpLeft";
        self.needrecoveryFrame=NO;
        self.BasicAni.completionBlock=^(POPAnimation *anim, BOOL finished) {
            if (finished) {
                self.layer.anchorPoint=CGPointMake(0.5, 0.5);
                self.frame=CGRectMake((self.frame.origin.x+self.frame.size.width*0.5), (self.frame.origin.y+self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
            }
        };
        
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@1;
        self.HelpBasicAni.toValue=@0;
        self.HelpAnimateType=@"RoateOutUpLeft_help";
        return self;
    };
}

-(UIView *(^)(void))RoateOutUpRight{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerRotation];
        self.BasicAni.fromValue=@(M_PI/2);
        self.BasicAni.toValue=@(0);
        self.frame=CGRectMake((self.frame.origin.x+self.frame.size.width*0.5), (self.frame.origin.y-self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
        self.layer.anchorPoint=CGPointMake(1, 0);;
        self.animateType=@"RoateOutUpRight";
        self.needrecoveryFrame=NO;
        self.BasicAni.completionBlock=^(POPAnimation *anim, BOOL finished) {
            if (finished) {
                self.layer.anchorPoint=CGPointMake(0.5, 0.5);
                self.frame=CGRectMake((self.frame.origin.x-self.frame.size.width*0.5), (self.frame.origin.y+self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
            }
        };
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@1;
        self.HelpBasicAni.toValue=@0;
        self.HelpAnimateType=@"RoateOutUpRight_help";
        return self;
    };
}

-(UIView *(^)(void))flipX{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerRotationX];
        self.BasicAni.fromValue=@0;
        self.BasicAni.toValue=@(M_PI/2);
        self.animateType=@"flipX";
        return self;
    };
}

-(UIView *(^)(void))flipXOut{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerRotationX];
        self.BasicAni.fromValue=@0;
        self.BasicAni.toValue=@(M_PI/2);;
        
        self.animateType=@"flipXOut";
        
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@1;
        self.HelpBasicAni.toValue=@0;
        self.HelpAnimateType=@"flipXOut_help";
        return self;
    };
}

-(UIView *(^)(void))flipY{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerRotationY];
        self.BasicAni.fromValue=@0;
        self.BasicAni.toValue=@(M_PI/2.0001);  //pop库的一个Bug https://github.com/facebook/pop/issues/71
        self.needrecoveryFrame=NO;
        self.animateType=@"flipY";
        return self;
    };
}

-(UIView *(^)(void))flipYOut{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerRotationY];
        self.BasicAni.fromValue=@0;
        self.BasicAni.toValue=@(M_PI/2.0001);  //pop库的一个Bug https://github.com/facebook/pop/issues/71
        self.needrecoveryFrame=NO;
        self.animateType=@"flipYOut";
        
        [self initHelpPBAnimate:BasicAnimation];
        self.HelpBasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.HelpBasicAni.fromValue=@1;
        self.HelpBasicAni.toValue=@0;
        self.HelpAnimateType=@"flipYOut_help";
        return self;
    };
}

-(UIView *(^)(void))slideInDown{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
        self.BasicAni.fromValue=[NSNumber numberWithFloat:self.frame.origin.y+200];
        self.BasicAni.toValue=[NSNumber numberWithFloat:self.initSize.origin.y+self.initSize.size.height/2];
        self.animateType=@"slideInDown";
        return self;
    };
}

-(UIView *(^)(void))slideInUp{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
        self.BasicAni.fromValue=[NSNumber numberWithFloat:self.frame.origin.y-200];
        self.BasicAni.toValue=[NSNumber numberWithFloat:self.initSize.origin.y+self.initSize.size.height/2];
        self.animateType=@"slideInUp";
        return self;
    };
}

-(UIView *(^)(void))slideInLeft{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
        self.BasicAni.fromValue=[NSNumber numberWithFloat:self.frame.origin.x-200];
        self.BasicAni.toValue=[NSNumber numberWithFloat:self.initSize.origin.x+self.initSize.size.width/2];
        self.animateType=@"slideInLeft";
        return self;
    };
}

-(UIView *(^)(void))slideInRight{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
        self.BasicAni.fromValue=[NSNumber numberWithFloat:self.frame.origin.x+200];
        self.BasicAni.toValue=[NSNumber numberWithFloat:self.initSize.origin.x+self.initSize.size.width/2];
        self.animateType=@"slideInRight";
        return self;
    };
}

-(UIView *(^)(void))slideOutUp{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
        self.BasicAni.toValue=[NSNumber numberWithFloat:self.frame.origin.y-200];
        self.BasicAni.fromValue=[NSNumber numberWithFloat:self.initSize.origin.y+self.initSize.size.height/2];
        self.animateType=@"slideOutUp";
        return self;
    };
}

-(UIView *(^)(void))slideOutDown{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
        self.BasicAni.toValue=[NSNumber numberWithFloat:self.frame.origin.y+200];
        self.BasicAni.fromValue=[NSNumber numberWithFloat:self.initSize.origin.y+self.initSize.size.height/2];
        self.animateType=@"slideOutDown";
        return self;
    };
}

-(UIView *(^)(void))slideOutRight{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
        self.BasicAni.toValue=[NSNumber numberWithFloat:self.window.bounds.size.width+self.frame.size.width];
        self.BasicAni.fromValue=[NSNumber numberWithFloat:self.initSize.origin.x+self.initSize.size.width/2];
        self.animateType=@"slideOutRight";
        return self;
    };
}

-(UIView *(^)(void))slideOutLeft{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
        self.BasicAni.toValue=[NSNumber numberWithFloat:self.frame.origin.x-200];
        self.BasicAni.fromValue=[NSNumber numberWithFloat:self.initSize.origin.x+self.initSize.size.width/2];
        self.animateType=@"slideOutLeft";
        return self;
    };
}


-(UIView *(^)(void))ZoomIn{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerScaleXY];
        self.BasicAni.toValue=[NSValue valueWithCGSize:CGSizeMake(1, 1)];;
        self.BasicAni.fromValue=[NSValue valueWithCGSize:CGSizeMake(0, 0)];
        self.animateType=@"ZoomIn";
        return self;
    };
}

-(UIView *(^)(void))ZoomInDown{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerScaleXY];
        self.frame=CGRectMake((self.frame.origin.x), (self.frame.origin.y-self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
        self.layer.anchorPoint=CGPointMake(0.5, 0);;
        self.BasicAni.toValue=[NSValue valueWithCGSize:CGSizeMake(1, 1)];;
        self.BasicAni.fromValue=[NSValue valueWithCGSize:CGSizeMake(0, 0)];
        self.animateType=@"ZoomInDown";
        return self;
    };
}
-(UIView *(^)(void))ZoomInUp{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerScaleXY];
        self.frame=CGRectMake((self.frame.origin.x), (self.frame.origin.y+self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
        self.layer.anchorPoint=CGPointMake(0.5, 1);;
        self.BasicAni.toValue=[NSValue valueWithCGSize:CGSizeMake(1, 1)];;
        self.BasicAni.fromValue=[NSValue valueWithCGSize:CGSizeMake(0, 0)];
        self.animateType=@"ZoomInUp";
        return self;
    };
}
-(UIView *(^)(void))ZoomInLeft{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerScaleXY];
        self.frame=CGRectMake((self.frame.origin.x-self.frame.size.width*0.5), (self.frame.origin.y-self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
        self.layer.anchorPoint=CGPointMake(0, 0);;
        self.BasicAni.toValue=[NSValue valueWithCGSize:CGSizeMake(1, 1)];;
        self.BasicAni.fromValue=[NSValue valueWithCGSize:CGSizeMake(0, 0)];
        self.animateType=@"ZoomInLeft";
        return self;
    };
}
-(UIView *(^)(void))ZoomInRight{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerScaleXY];
        self.frame=CGRectMake((self.frame.origin.x+self.frame.size.width*0.5), (self.frame.origin.y-self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
        self.layer.anchorPoint=CGPointMake(1, 0);;
        self.BasicAni.toValue=[NSValue valueWithCGSize:CGSizeMake(1, 1)];;
        self.BasicAni.fromValue=[NSValue valueWithCGSize:CGSizeMake(0, 0)];
        self.animateType=@"ZoomInRight";
        return self;
    };
}
-(UIView *(^)(void))ZoomOut{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerScaleXY];
        self.BasicAni.fromValue=[NSValue valueWithCGSize:CGSizeMake(1, 1)];;
        self.BasicAni.toValue=[NSValue valueWithCGSize:CGSizeMake(0, 0)];
        self.animateType=@"ZoomOut";
        return self;
    };
}
-(UIView *(^)(void))ZoomOutDown{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerScaleXY];
        self.frame=CGRectMake((self.frame.origin.x), (self.frame.origin.y-self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
        self.layer.anchorPoint=CGPointMake(0.5, 0);;
        self.BasicAni.fromValue=[NSValue valueWithCGSize:CGSizeMake(1, 1)];;
        self.BasicAni.toValue=[NSValue valueWithCGSize:CGSizeMake(0, 0)];
        self.animateType=@"ZoomOutDown";
        return self;
    };
}
-(UIView *(^)(void))ZoomOutUp{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerScaleXY];
        self.frame=CGRectMake((self.frame.origin.x), (self.frame.origin.y+self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
        self.layer.anchorPoint=CGPointMake(0.5, 1);;
        self.BasicAni.fromValue=[NSValue valueWithCGSize:CGSizeMake(1, 1)];;
        self.BasicAni.toValue=[NSValue valueWithCGSize:CGSizeMake(0, 0)];
        self.animateType=@"ZoomOutUp";
        return self;
    };
}
-(UIView *(^)(void))ZoomOutLeft{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerScaleXY];
        self.frame=CGRectMake((self.frame.origin.x-self.frame.size.width*0.5), (self.frame.origin.y-self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
        self.layer.anchorPoint=CGPointMake(0, 0);;
        self.BasicAni.fromValue=[NSValue valueWithCGSize:CGSizeMake(1, 1)];;
        self.BasicAni.toValue=[NSValue valueWithCGSize:CGSizeMake(0, 0)];
        self.animateType=@"ZoomOutLeft";
        return self;
    };
}
-(UIView *(^)(void))ZoomOutRight{
    return ^(void){
        [self initPBAnimate:BasicAnimation];
        self.BasicAni.property=[POPAnimatableProperty propertyWithName:kPOPLayerScaleXY];
        self.frame=CGRectMake((self.frame.origin.x+self.frame.size.width*0.5), (self.frame.origin.y-self.frame.size.height*0.5), self.frame.size.width, self.frame.size.height);
        self.layer.anchorPoint=CGPointMake(1, 0);;
        self.BasicAni.fromValue=[NSValue valueWithCGSize:CGSizeMake(1, 1)];;
        self.BasicAni.toValue=[NSValue valueWithCGSize:CGSizeMake(0, 0)];
        self.animateType=@"ZoomOutRight";
        return self;
    };
}

#pragma mark 动画事件

-(UIView *(^)(void))Play{
    
    return ^(void){
        if (self.isPlaying == NO) {
            switch (self.animationType) {
                case SpringAnimation:
                    [self.layer pop_addAnimation:self.SpringAni forKey:self.animateType];
                    [self.layer pop_addAnimation:self.HelpSpringAni forKey:self.HelpAnimateType];
                    break;
                case BasicAnimation:
                    [self.layer pop_addAnimation:self.BasicAni forKey:self.animateType];
                    [self.layer pop_addAnimation:self.HelpBasicAni forKey:self.HelpAnimateType];
                    break;
                case DecayAnimation:
                    [self.layer pop_addAnimation:self.DecayAni forKey:self.animateType];
                    break;
                default:
                    break;
            }
        }
        
        return self;
    };
    
}

-(UIView *(^)(void))Stop{
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

#pragma mark 拓展方法，Delegate

-(void)initPBAnimate:(PBAnimationType)animationType{
    self.animationType=animationType;
    self.initSize=self.frame;
    self.needrecoveryFrame=YES;
    switch (animationType) {
        case BasicAnimation:
            self.BasicAni=[POPBasicAnimation animation];
            self.BasicAni.delegate=self;
            break;
        case DecayAnimation:
            self.DecayAni=[POPDecayAnimation animation];
            break;
        case SpringAnimation:
            self.SpringAni=[POPSpringAnimation animation];
            self.SpringAni.delegate=self;
            break;
        default:
            break;
    }
}

-(void)initHelpPBAnimate:(PBAnimationType)animationType{
    self.animationType=animationType;
    self.initSize=self.frame;
    switch (animationType) {
        case BasicAnimation:
            self.HelpBasicAni=[POPBasicAnimation animation];
            self.HelpBasicAni.delegate=self;
            break;
        case DecayAnimation:
            self.HelpDecayAni=[POPDecayAnimation animation];
            break;
        case SpringAnimation:
            self.HelpSpringAni=[POPSpringAnimation animation];
            self.HelpSpringAni.delegate=self;
            break;
        default:
            break;
    }
}


- (void)pop_animationDidStart:(POPAnimation *)anim{
    NSLog(@"pop_animationDidStart deldegate");
    self.isPlaying=YES;
    NSLog(@"动画是否在执行：%hhd",self.isPlaying);
}


- (void)pop_animationDidReachToValue:(POPAnimation *)anim{
    NSLog(@"动画执行过程中");
    NSLog(@"监听动画状态%@",[self.layer pop_animationForKey:self.animateType]);
}


- (void)pop_animationDidStop:(POPAnimation *)anim finished:(BOOL)finished{
    if (finished) {
        self.isPlaying=NO;
        [self recoveryLayer];
        
    }
}

-(void)recoveryLayer{
    if (self.needrecoveryFrame) {
        self.layer.anchorPoint=CGPointMake(0.5, 0.5);
        self.frame=self.initSize;
    }
    self.layer.opacity=1;
    self.BasicAni=nil;
    self.HelpBasicAni=nil;
    self.SpringAni=nil;
    self.HelpSpringAni=nil;
    self.DecayAni=nil;
    
    NSLog(@"动画是否在执行：%hhd",self.isPlaying);
    [self.layer removeAllAnimations];
}

#pragma mark 拓展属性
-(NSString *)animateType{
    return animateType_tmp;
}
-(void)setAnimateType:(NSString *)animateType{
    animateType_tmp=animateType;
}
-(NSString *)HelpAnimateType{
    return HelpAnimateType_tmp;
}
-(void)setHelpAnimateType:(NSString *)HelpAnimateType{
    HelpAnimateType_tmp=HelpAnimateType;
}
-(POPSpringAnimation*)SpringAni{
    return SpringAni_tmp;
}
-(void)setSpringAni:(POPSpringAnimation *)SpringAni{
    SpringAni_tmp=SpringAni;
}
-(POPBasicAnimation*)BasicAni{
    return BasicAni_tmp;
}
-(void)setBasicAni:(POPBasicAnimation *)BasicAni{
    BasicAni_tmp=BasicAni;
}
-(POPDecayAnimation *)DecayAni{
    return DecayAni_tmp;
}
-(void)setDecayAni:(POPDecayAnimation *)DecayAni{
    DecayAni_tmp=DecayAni;
}
-(POPSpringAnimation*)HelpSpringAni{
    return HelpSpringAni_tmp;
}
-(void)setHelpSpringAni:(POPSpringAnimation *)HelpSpringAni{
    HelpSpringAni_tmp=HelpSpringAni;
}
-(POPBasicAnimation*)HelpBasicAni{
    return HelpBasicAni_tmp;
}
-(void)setHelpBasicAni:(POPBasicAnimation *)HelpBasicAni{
    HelpBasicAni_tmp=HelpBasicAni;
}
-(POPDecayAnimation *)HelpDecayAni{
    return HelpDecayAni_tmp;
}
-(void)setHelpDecayAni:(POPDecayAnimation *)HelpDecayAni{
    HelpDecayAni_tmp=HelpDecayAni;
}
-(PBAnimationType)animationType{
    return animationType_tmp;
}
-(void)setAnimationType:(PBAnimationType)animationType{
    animationType_tmp=animationType;
}
-(CGRect)initSize{
    return initSize_tmp;
}
-(void)setInitSize:(CGRect)initSize{
    initSize_tmp=initSize;
}
-(BOOL)needrecoveryFrame{
    return needrecoveryFrame_tmp;
}
-(void)setNeedrecoveryFrame:(BOOL)needrecoveryFrame{
    needrecoveryFrame_tmp=needrecoveryFrame;
}
-(BOOL)isPlaying{
    return isPlaying_tmp;
}
-(void)setIsPlaying:(BOOL)isPlaying{
    isPlaying_tmp=isPlaying;
}
@end
