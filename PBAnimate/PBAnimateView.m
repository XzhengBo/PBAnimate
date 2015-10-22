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
@property(nonatomic)POPSpringAnimation *ani;

@end

@implementation PBAnimateView

#pragma mark 动画属性
-(PBAnimateView *(^)(float vaule))PBAnimateBounciness{
    return ^(float vaule){
        if (vaule<20 && vaule>0) {
            self.ani.springBounciness = vaule;
        }
        else{
            self.ani.springBounciness = 4;
        }
        return self;
    };
}
-(PBAnimateView *(^)(float vaule))PBAnimateTension{
    return ^(float vaule){
        if (vaule<20 && vaule>0) {
            self.ani.dynamicsTension = vaule;
        }
        else{
            self.ani.dynamicsTension = 4;
        }
        return self;
    };
}

-(PBAnimateView *(^)(float vaule))PBAnimateFriction{
    return ^(float vaule){
        self.ani.dynamicsFriction = vaule;
        return self;
    };
}

-(PBAnimateView *(^)(float vaule))PBAnimateMass{
    return ^(float vaule){
        self.ani.dynamicsMass = vaule;
        return self;
    };
}
-(PBAnimateView *(^)(id vaule))PBAnimatetoValue{
    return ^(id vaule){
        self.ani.toValue =vaule;
        return self;
    };
}

-(PBAnimateView *(^)(float vaule))PBAnimatePopScaleSize{
    return ^(float vaule){
        self.ani.toValue =[NSValue valueWithCGSize:CGSizeMake(vaule, vaule)];
        return self;
    };
}

#pragma mark 动画类型
-(PBAnimateView *(^)(float speed))PBAnimateShake{
    return ^(float speed){
        
        self.ani = [POPSpringAnimation animation];
        self.ani.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionX];
        self.ani.toValue=[NSValue valueWithCGPoint:CGPointMake((self.frame.origin.x-50), 0)];
        if (speed<20 && speed>0) {
            self.ani.springSpeed=speed;
        }
        else{
            self.ani.springSpeed=4;
        }
        self.ani.autoreverses=YES;
        self.animateType=@"shake";
        return self;
    };
}

-(PBAnimateView *(^)(float speed))PBAnimatePop{
    return ^(float speed){
        self.ani = [POPSpringAnimation animation];
        self.ani.property=[POPAnimatableProperty propertyWithName:kPOPLayerSize];
        self.ani.toValue =[NSValue valueWithCGSize:CGSizeMake((self.bounds.size.width)*2, (self.bounds.size.height)*2)];
        if (speed<20 && speed>0) {
            self.ani.springSpeed=speed;
        }
        else{
            self.ani.springSpeed=4;
        }
        self.ani.autoreverses=YES;
        self.animateType=@"pop";
        
        return self;
    };
}

-(PBAnimateView *(^)(float speed))PBAnimatemorph{
    return ^(float speed){
        self.ani = [POPSpringAnimation animation];
        self.ani.property=[POPAnimatableProperty propertyWithName:kPOPLayerSize];
        self.ani.toValue =[NSValue valueWithCGSize:CGSizeMake((self.bounds.size.width)*2, (self.bounds.size.height)*2)];
        if (speed<20 && speed>0) {
            self.ani.springSpeed=speed;
        }
        else{
            self.ani.springSpeed=4;
        }
        self.ani.autoreverses=YES;
        self.animateType=@"pop";
        return self;
    };
}

-(PBAnimateView *(^)(float speed))PBAnimateBounce{
    return ^(float speed){
        self.ani = [POPSpringAnimation animation];
        self.ani.property=[POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
        self.ani.toValue =[NSValue valueWithCGPoint:CGPointMake((self.frame.origin.y-20), 0)];
        if (speed<20 && speed>0) {
            self.ani.springSpeed=speed;
        }
        else{
            self.ani.springSpeed=4;
        }
        self.ani.autoreverses=YES;
        self.animateType=@"bounce";
        return self;
    };
}

-(PBAnimateView *(^)(float speed))PBAnimateFlash{
    return ^(float speed){
        self.ani = [POPSpringAnimation animation];
        self.ani.property=[POPAnimatableProperty propertyWithName:kPOPLayerOpacity];
        self.ani.toValue =@(0);
        if (speed<20 && speed>0) {
            self.ani.springSpeed=speed;
        }
        else{
            self.ani.springSpeed=4;
        }
        self.ani.autoreverses=YES;
        self.animateType=@"flash";
        return self;
    };
}

-(PBAnimateView *(^)(float speed))PBAnimatePulse{
    return ^(float speed){
        self.ani = [POPSpringAnimation animation];
        self.ani.property=[POPAnimatableProperty propertyWithName:kPOPLayerSize];
        self.ani.toValue =[NSValue valueWithCGSize:CGSizeMake((self.frame.size.width+30), (self.frame.size.height+30))];
        if (speed<20 && speed>0) {
            self.ani.springSpeed=speed;
        }
        else{
            self.ani.springSpeed=4;
        }
        self.ani.autoreverses=YES;
        self.ani.repeatCount=2;
        self.animateType=@"pluse";
        return self;
    };
}

-(PBAnimateView *(^)(float speed))PBAnimateRubber{
    return ^(float speed){
        self.ani = [POPSpringAnimation animation];
        self.ani.property=[POPAnimatableProperty propertyWithName:kPOPLayerSize];
        self.ani.toValue =[NSValue valueWithCGSize:CGSizeMake((self.frame.size.width+200), (self.frame.size.height-80))];
        if (speed<20 && speed>0) {
            self.ani.springSpeed=speed;
        }
        else{
            self.ani.springSpeed=4;
        }
        self.ani.autoreverses=YES;
        self.animateType=@"pluse";
        return self;
    };
}

-(PBAnimateView *(^)(float speed))PBAnimateSwing{
    return ^(float speed){
        self.ani = [POPSpringAnimation animation];
        self.ani.property=[POPAnimatableProperty propertyWithName:kPOPLayerRotation];
        self.ani.toValue =@(M_PI/2);
        if (speed<20 && speed>0) {
            self.ani.springSpeed=speed;
        }
        else{
            self.ani.springSpeed=4;
        }
        self.ani.autoreverses=YES;
        self.animateType=@"swing";
        return self;
    };
}

-(PBAnimateView *(^)(float speed))PBAnimateTada{
    return ^(float speed){
        self.ani = [POPSpringAnimation animation];
        self.ani.property=[POPAnimatableProperty propertyWithName:kPOPLayerBackgroundColor];
        self.ani.toValue =[UIColor redColor];
        if (speed<20 && speed>0) {
            self.ani.springSpeed=speed;
        }
        else{
            self.ani.springSpeed=4;
        }
        self.ani.autoreverses=YES;
        self.animateType=@"tada";
        return self;
    };
}

#pragma mark 动画事件
-(PBAnimateView *(^)(bool play))PBAnimate{
    return ^(bool play){
        if (play) {
            [self.layer pop_addAnimation:self.ani forKey:self.animateType];
        }
        else{
            [self.layer pop_removeAnimationForKey:self.animateType];
        }
        return self;
    };
}

-(void)PBAnimateEndCallback:(PBAnimateCompletion)compblock{
    
    self.ani.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            compblock();
        }
    };
    
}

@end
