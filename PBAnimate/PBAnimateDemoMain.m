//
//  PBAnimateDemoMain.m
//  PBAnimate
//
//  Created by xzheng on 15/10/15.
//  Copyright © 2015年 xzheng. All rights reserved.
//

#import "PBAnimateDemoMain.h"
#import "PBAnimate.h"

@interface PBAnimateDemoMain()

@property(nonatomic)NSMutableArray *DemoDataList;
@property(nonatomic)NSArray *FadeIn;
@property(nonatomic)NSArray *FadeOut;
@property(nonatomic)NSArray *SlideIn;
@property(nonatomic)NSArray *SlideOut;
@property(nonatomic)NSArray *RoateIn;
@property(nonatomic)NSArray *RoateOut;
@property(nonatomic)NSArray *Flip;

@property(nonatomic)UITableView *DemoTableView;
@property(nonatomic)UIView *DemoContentView;
@property(nonatomic)PBAnimateView *DemoView;
@end

@implementation PBAnimateDemoMain

- (instancetype)init
{
    self = [super init];
    if (self) {
         [self initData];
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title=@"PBAnimate";
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.DemoTableView=[[UITableView alloc]init];
    self.DemoTableView.backgroundColor=[UIColor colorWithRed:249.0/255.0 green:249.0/255.0 blue:249.0/255.0 alpha:1];
    self.DemoTableView.delegate=self;
    self.DemoTableView.dataSource=self;
    
    self.DemoView=[[PBAnimateView alloc]init];
    self.DemoView.backgroundColor=[UIColor colorWithRed:117.0/255.0 green:101.0/255.0 blue:239.0/255.0 alpha:1];
//    self.DemoView.layer.cornerRadius=40;
    self.DemoView.layer.masksToBounds=YES;
    self.DemoContentView=[[UIView alloc]init];
    
    [self.view addSubview:self.DemoContentView];
    [self.DemoContentView addSubview:self.DemoView];
    [self.view addSubview:self.DemoTableView];
    
//     UIBarButtonItem *StopAnimate=[[UIBarButtonItem alloc]initWithTitle:@"停止" style:UIBarButtonItemStylePlain target:self action:@selector(StopAnimate)];
//    [self.navigationItem setRightBarButtonItem:StopAnimate];
    
    [self.DemoContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64);
        make.bottom.equalTo(self.DemoTableView.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    
    [self.DemoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.DemoContentView);
        make.height.mas_equalTo(80);
        make.width.mas_equalTo(80);
    }];
    
    [self.DemoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.DemoContentView.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(self.DemoContentView).offset(80);
       
    }];
   
    
}

#pragma mark -- tableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.DemoDataList objectAtIndex:section]count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.DemoDataList.count;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"FadeIn";
            break;
        case 1:
            return @"FadeOut";
            break;
        case 2:
            return @"RoateIn";
            break;
        case 3:
            return @"RoateOut";
            break;
        case 4:
            return @"SlideIn";
            break;
        case 5:
            return @"SlideOut";
            break;
        case 6:
            return @"Filp";
            break;
        default:
            return @"";
            break;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *reuseIdentifier=@"reuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text=self.FadeIn[indexPath.row];
            break;
        case 1:
            cell.textLabel.text=self.FadeOut[indexPath.row];
            break;
        case 2:
            cell.textLabel.text=self.RoateIn[indexPath.row];
            break;
        case 3:
            cell.textLabel.text=self.RoateOut[indexPath.row];
            break;
        case 4:
            cell.textLabel.text=self.SlideIn[indexPath.row];
            break;
        case 5:
            cell.textLabel.text=self.SlideOut[indexPath.row];
            break;
        case 6:
            cell.textLabel.text=self.Flip[indexPath.row];
            break;
        default:
            break;
    }
    
    cell.backgroundColor=[UIColor colorWithRed:249.0/255.0 green:249.0/255.0 blue:249.0/255.0 alpha:1];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *selectValue=[[self.DemoDataList objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
//    if ([selectValue isEqualToString:@"shake"]) {
////        self.DemoView.Shake(nil).Play();
//        [self.DemoView PBAnimateEndCallback:^() {
//                NSLog(@"动完了");
//        }];
//        
//    }
//    if ([selectValue isEqualToString:@"pop"]) {
//        self.DemoView.Pop(nil).Play();
//    }
//    if ([selectValue isEqualToString:@"bounce"]) {
//        id toValue =[NSValue valueWithCGPoint:CGPointMake((0), 0)];
//        self.DemoView.Bounce(toValue).Bounciness(4).Autoreverses(NO).Play();
//
//        [self.DemoView PBAnimateStartCallback:^{
//            NSLog(@"bounce 动画开始");
//        }];
//        
//        [self.DemoView PBAnimateEndCallback:^() {
//            NSLog(@"bounce 动画结束");
//        }];
//        
//    }
//    if ([selectValue isEqualToString:@"flash"]) {
//        self.DemoView.Flash(nil).Play();
//    }
//    if ([selectValue isEqualToString:@"pulse"]) {
//        id toValue =[NSValue valueWithCGSize:CGSizeMake(200, 200)];
//        self.DemoView.Pulse(toValue).Play();
//    }
//    if ([selectValue isEqualToString:@"rubberBand"]) {
//        self.DemoView.Rubber(nil).Play();
//        
//    }
//    if ([selectValue isEqualToString:@"swing"]) {
//        self.DemoView.Swing(nil).Play();
//        [self.DemoView PBAnimateEndCallback:^() {
//            NSLog(@"swing finish");
//        }];
//       
//    }
//    
//    if ([selectValue isEqualToString:@"tada"]) {
//        id fromVal=[UIColor blueColor];
//        id toVal=[UIColor grayColor];
//        self.DemoView.Pop(nil).Play();
//        
//    }
//    
//    if ([selectValue isEqualToString:@"countdown"]) {
//       
////        self.DemoView.CountDown(nil).Play();
//    }
    
    if ([selectValue isEqualToString:@"fadeIn"]) {
        self.DemoView.fadeIn().Duration(1).Play();
    }
    if ([selectValue isEqualToString:@"fadeInDown"]) {
        self.DemoView.fadeInDown().Duration(1).Play();
    }
    if ([selectValue isEqualToString:@"fadeInUp"]) {
        self.DemoView.fadeInUp().Duration(1).Play();
    }
    if ([selectValue isEqualToString:@"fadeInRight"]) {
        self.DemoView.fadeInRight().Duration(1).Play();
    }
    if ([selectValue isEqualToString:@"fadeInLeft"]) {
        self.DemoView.fadeInLeft().Duration(1).Play();
    }
    if ([selectValue isEqualToString:@"fadeOut"]) {
//        id fromVal=[NSNumber numberWithFloat:0.5];
//        id toVal=[NSNumber numberWithFloat:0.2];
//        self.DemoView.fadeOut().Duration(1).To(toVal).From(fromVal).Play();
        self.DemoView.fadeOut().Play();
    }
    if ([selectValue isEqualToString:@"fadeOutDown"]) {
        self.DemoView.fadeOutDown().Duration(1).Play();
    }
    if ([selectValue isEqualToString:@"fadeOutLeft"]) {
        self.DemoView.fadeOutLeft().Duration(1).Play();
    }
    if ([selectValue isEqualToString:@"fadeOutRight"]) {
        self.DemoView.fadeOutRight().Duration(1).Play();
    }
    if ([selectValue isEqualToString:@"fadeOutUp"]) {
        self.DemoView.fadeOutUp().Duration(1).Play();
    }
    
    if ([selectValue isEqualToString:@"slideInDown"]) {
        self.DemoView.slideInDown().Duration(1).Play();
    }
    if ([selectValue isEqualToString:@"RoateIn"]) {
        self.DemoView.RoateIn().Duration(1).Play();
    }
    
    if ([selectValue isEqualToString:@"flipX"]) {
        self.DemoView.flipX().Autoreverses(YES).Duration(1).Play();
    }
    if ([selectValue isEqualToString:@"flipY"]) {
        self.DemoView.flipY().Duration(1).Autoreverses(YES).Play();
    }
    if ([selectValue isEqualToString:@"flipXOut"]) {
        self.DemoView.flipXOut().Autoreverses(YES).Duration(1).Play();
    }
    if ([selectValue isEqualToString:@"flipYOut"]) {
        self.DemoView.flipYOut().Autoreverses(YES).Duration(1).Play();
    }
    if ([selectValue isEqualToString:@"RoateOut"]) {
        self.DemoView.RoateOut().Duration(1).Play();
    }
    if ([selectValue isEqualToString:@"slideInRight"]) {
        self.DemoView.slideInRight().Duration(1).Play();
    }
    if ([selectValue isEqualToString:@"slideInLeft"]) {
        self.DemoView.slideInLeft().Duration(1).Play();
    }
    if ([selectValue isEqualToString:@"slideInUp"]) {
        self.DemoView.slideInUp().Duration(1).Play();
    }
    if ([selectValue isEqualToString:@"slideOutDown"]) {
        self.DemoView.slideOutDown().Duration(1).Play();
    }
    if ([selectValue isEqualToString:@"slideOutUp"]) {
        self.DemoView.slideOutUp().Duration(1).Play();
    }
    if ([selectValue isEqualToString:@"slideOutRight"]) {
        self.DemoView.slideOutRight().Duration(1).Play();
    }
    if ([selectValue isEqualToString:@"slideOutLeft"]) {
        self.DemoView.slideOutLeft().Duration(1).Play();
    }
    
    if ([selectValue isEqualToString:@"RoateInDownLeft"]) {
        self.DemoView.RoateInDownLeft().Duration(1).Play();
    }
    
    if ([selectValue isEqualToString:@"RoateInDownRight"]) {
        self.DemoView.RoateInDownRight().Duration(1).Play();
        
    }
    NSLog(@"%@",selectValue);

}

#pragma mark -- 初始化数据
-(void)initData{
    self.FadeIn=[[NSArray alloc]initWithObjects:@"fadeIn",@"fadeInDown",@"fadeInUp",@"fadeInRight",@"fadeInLeft", nil];
    self.FadeOut=[[NSArray alloc]initWithObjects:@"fadeOut",@"fadeOutDown",@"fadeOutUp",@"fadeOutRight",@"fadeOutLeft", nil];
    self.RoateIn=[[NSArray alloc]initWithObjects:@"RoateIn",@"RoateInDownLeft",@"RoateInDownRight",@"RoateInUpRight",@"RoateInUpLeft", nil];
    self.RoateOut=[[NSArray alloc]initWithObjects:@"RoateOut",@"RoateOutDownLeft",@"RoateOutDownRight",@"RoateOutUpRight",@"RoateOutUpLeft", nil];
    self.SlideIn=[[NSArray alloc]initWithObjects:@"slideInDown",@"slideInRight",@"slideInLeft",@"slideInUp", nil];
    self.SlideOut=[[NSArray alloc]initWithObjects:@"slideOutDown",@"slideOutUp",@"slideOutRight",@"slideOutLeft", nil];
    self.Flip=[[NSArray alloc]initWithObjects:@"flipX",@"flipY", @"flipXOut",@"flipYOut",nil];
    self.DemoDataList=[[NSMutableArray alloc]initWithObjects:self.FadeIn,self.FadeOut,self.RoateIn,self.RoateOut,self.SlideIn,self.SlideOut,self.Flip,nil];
    
//    self.DemoDataList=[[NSArray alloc]initWithObjects:@"slideInDown",@"flash",@"pulse",@"rubberBand",@"shake",@"swing",@"tada",@"countdown",@"fadeIn",@"fadeInDown",nil];
    
}
#pragma mark -- 事件
-(void)StopAnimate{
    NSLog(@"stop");
    self.DemoView.Stop();
}
@end
