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

@property(nonatomic)NSArray *DemoDataList;
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
    self.DemoView.layer.cornerRadius=10;
    self.DemoView.layer.masksToBounds=YES;
    self.DemoContentView=[[UIView alloc]init];
    
    [self.view addSubview:self.DemoContentView];
    [self.DemoContentView addSubview:self.DemoView];
    [self.view addSubview:self.DemoTableView];
    
     UIBarButtonItem *StopAnimate=[[UIBarButtonItem alloc]initWithTitle:@"停止" style:UIBarButtonItemStylePlain target:self action:@selector(StopAnimate)];
    [self.navigationItem setRightBarButtonItem:StopAnimate];
    
    [self.DemoContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64);
        make.bottom.equalTo(self.DemoTableView.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    
    [self.DemoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.DemoContentView);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    [self.DemoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.DemoContentView.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(self.DemoContentView);
       
    }];
   
    
}

#pragma mark -- tableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DemoDataList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *reuseIdentifier=@"reuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.textLabel.text=self.DemoDataList[indexPath.row];
    cell.backgroundColor=[UIColor colorWithRed:249.0/255.0 green:249.0/255.0 blue:249.0/255.0 alpha:1];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *selectValue=[self.DemoDataList objectAtIndex:indexPath.row];
    if ([selectValue isEqualToString:@"shake"]) {
        self.DemoView.PBAnimateShake(nil).PBAnimate(YES);
        [self.DemoView PBAnimateEndCallback:^() {
                NSLog(@"动完了");
        }];
        
    }
    if ([selectValue isEqualToString:@"pop"]) {
        self.DemoView.PBAnimatePop(nil).PBAnimate(YES);
    }
    if ([selectValue isEqualToString:@"bounce"]) {
        id toValue =[NSValue valueWithCGPoint:CGPointMake((0), 0)];
        self.DemoView.PBAnimateBounce(toValue).PBAnimateBounciness(4).PBAnimate(YES);
    }
    if ([selectValue isEqualToString:@"flash"]) {
        self.DemoView.PBAnimateFlash(nil).PBAnimate(YES);
    }
    if ([selectValue isEqualToString:@"pulse"]) {
        id toValue =[NSValue valueWithCGSize:CGSizeMake(200, 200)];
        self.DemoView.PBAnimatePulse(toValue).PBAnimate(YES);
    }
    if ([selectValue isEqualToString:@"rubberBand"]) {
        self.DemoView.PBAnimateRubber(nil).PBAnimate(YES);
        [self.DemoView PBAnimateEndCallback:^() {
            NSLog(@"动完了");
        }];
    }
    if ([selectValue isEqualToString:@"swing"]) {
        self.DemoView.PBAnimateSwing(nil).PBAnimate(YES);
        [self.DemoView PBAnimateEndCallback:^() {
            NSLog(@"swing finish");
        }];
        
    }
    
    if ([selectValue isEqualToString:@"tada"]) {
        id fromVal=[UIColor blueColor];
        id toVal=[UIColor grayColor];
        self.DemoView.PBAnimateTada(toVal).PBAnimateFromValue(fromVal).PBAnimate(YES);
    }
    
    NSLog(@"%@",[self.DemoDataList objectAtIndex:indexPath.row]);

}

#pragma mark -- 初始化数据
-(void)initData{
    self.DemoDataList=[[NSArray alloc]initWithObjects:@"bounce",@"flash",@"pulse",@"rubberBand",@"shake",@"swing",@"tada",@"wobble",@"jello",nil];
    
}
#pragma mark -- 事件
-(void)StopAnimate{
    NSLog(@"stop");
    self.DemoView.PBAnimate(NO);
}
@end
