//
//  prosess.m
//  圆形进度条的绘制
//
//  Created by 王奥东 on 16/7/2.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "prosess.h"

@interface prosess()


@property(nonatomic,strong)UILabel *myLabel;
@property(nonatomic,strong)CAShapeLayer *layers;

@end

@implementation prosess


- (UILabel *)myLabel
{
    if (!_myLabel) {
        
        _myLabel = [[UILabel alloc]init];
    }
    return _myLabel;
}

- (void)layoutSubviews
{
    //必须写
    [super layoutSubviews];
    
    
     self.myLabel.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    //设置Label文字居中并添加
    self.myLabel.textAlignment = UITextAlignmentCenter;
    [self addSubview:self.myLabel];
    
   
    
   
    
}
- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    
    
    //修改 文字
    
    self.myLabel.text = [NSString stringWithFormat:@"%.2f%%",progress * 100];
    
    //每次绘制之前先取消之前的绘制
    [self.layers removeFromSuperlayer];

    
    
    //圆心
    CGPoint centers = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    //起点位置
    CGFloat startAngle = 0;
    
    //结束位置         进度条的数据 * 360 度
    CGFloat endAngle = self.progress * M_PI * 2 + startAngle;  //默认是 0;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:centers radius:100 startAngle:startAngle endAngle:endAngle clockwise:1];
    
    
    //画一根到 圆心的线
    [path addLineToPoint:centers];
    
    
    //通过layer绘制
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor blueColor].CGColor;
    
    //给自身Layer添加并保存自定义的Layer
    [self.layer addSublayer:layer];
    self.layers = layer;
    
}



@end
