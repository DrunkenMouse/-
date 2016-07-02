//
//  ViewController.m
//  圆形进度条的绘制
//
//  Created by 王奥东 on 16/7/2.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "ViewController.h"
#import "prosess.h"

@interface ViewController ()
//保存绘制路径的View
@property(nonatomic,strong)prosess *proView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    
    //设置并添加绘制路径的View
    prosess *proView = [[prosess alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    proView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:proView];
    
    //保存绘制路径的View
    self.proView = proView;
    
    //设置并添加slider
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(100, CGRectGetMaxY(proView.frame)+20, 200, 44)];
     [self.view addSubview:slider];
    
    //监听slider的值改变
    [slider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
    
    
   
    
   
    
}

-(void)sliderValueChange:(UISlider *)sender{
    
    //修改绘制路径View的进度
    self.proView.progress = sender.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
