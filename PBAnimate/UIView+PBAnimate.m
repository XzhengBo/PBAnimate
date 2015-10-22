//
//  UIView+PBAnimate.m
//  PBAnimate
//
//  Created by xzheng on 15/10/15.
//  Copyright © 2015年 xzheng. All rights reserved.
//

#import "UIView+PBAnimate.h"


@implementation UIView(PBAnimate)



-(UIView *) PBAnimateStopAll{
    [self pop_removeAllAnimations];
    return self;
}

-(UIView *(^)(NSString *))PBAnimateType{
    
    return ^(NSString *str) {
        //code
        if ([str isEqualToString:@"shake"]) {
            POPSpringAnimation *anim = [POPSpringAnimation animation];
            anim.property=[POPAnimatableProperty propertyWithName:kPOPLayerSize];
            anim.toValue             = [NSValue valueWithCGSize:CGSizeMake(200, 200)];
            anim.autoreverses=YES;
            anim.repeatForever=YES;
            [self pop_addAnimation:anim forKey:@"shake"];
        }
        else{
            NSLog(@"%@", str);
        }
        return self;
    };
}


@end
