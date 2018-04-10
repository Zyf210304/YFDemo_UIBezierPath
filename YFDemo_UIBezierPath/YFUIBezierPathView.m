//
//  YFUIBezierPathView.m
//  YFDemo_UIBezierPath
//
//  Created by 亚飞 on 2018/4/10.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import "YFUIBezierPathView.h"

@implementation YFUIBezierPathView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    //矩形贝塞尔曲线
    UIBezierPath* bezierPath_rect = [UIBezierPath bezierPathWithRect:CGRectMake(30, 50, 100, 100)];
    [bezierPath_rect moveToPoint:CGPointMake(60, 60)];
    [bezierPath_rect addLineToPoint:CGPointMake(80, 80)];
    [bezierPath_rect addLineToPoint:CGPointMake(60, 90)];
    //[bezierPath_rect closePath];
    //[bezierPath_rect removeAllPoints];
    bezierPath_rect.lineCapStyle = kCGLineCapButt;  //端点类型
    bezierPath_rect.lineJoinStyle = kCGLineJoinMiter;  //线条连接类型
    bezierPath_rect.miterLimit = 1;
    CGFloat dash[] = {20,1};
    [bezierPath_rect setLineDash:dash count:2 phase:0];
    bezierPath_rect.lineWidth = 10;

    //圆形 椭圆贝塞尔曲线
    UIBezierPath *bezierPath_oval = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(200, 50, 150, 100)];
    bezierPath_oval.lineWidth = 10;
    //还有圆角的贝塞尔曲线
    UIBezierPath *bezierPath_RoundedRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(30, 200, 100, 100) cornerRadius:20];
    bezierPath_RoundedRect.lineWidth = 10;

    //绘制可选择圆角方位的贝塞尔曲线
    UIBezierPath *bezierPath_RoundedCornerRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(200, 200, 100, 100) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
    bezierPath_RoundedCornerRect.lineWidth = 10;
    
    //绘制圆弧曲线
    UIBezierPath *bezierPath_ArcCenter = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 400) radius:50 startAngle:M_PI / 2 * 3 endAngle:M_PI / 3 clockwise:YES];
    bezierPath_ArcCenter.lineWidth = 10;

    //添加二次 三次贝塞尔曲线
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 2;
    [bezierPath moveToPoint:CGPointMake(10, 520)];
    [bezierPath addLineToPoint:CGPointMake(50, 530)];
    [bezierPath addQuadCurveToPoint:CGPointMake(100, 510) controlPoint:CGPointMake(80, 650)];
    [bezierPath addCurveToPoint:CGPointMake(200, 530) controlPoint1:CGPointMake(130, 600) controlPoint2:CGPointMake(170, 400)];
    [bezierPath addArcWithCenter:CGPointMake(300, 400) radius:50 startAngle:0 endAngle:M_PI * 2 clockwise:YES];

    [bezierPath moveToPoint:CGPointMake(20, 520)];
    [bezierPath addLineToPoint:CGPointMake(40, 520)];

    //根据CGPathRef绘制贝塞尔曲线
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 10, 640);
    CGPathAddCurveToPoint(path, NULL, 100, 700, 250, 550, 350, 650);
    UIBezierPath *bezierPath_CGPath = [UIBezierPath bezierPathWithCGPath:path];
    bezierPath_CGPath.lineWidth = 4;
    //选择填充颜色
    [[UIColor redColor] set];
    [bezierPath_rect fill];
    [bezierPath_oval fill];
    [bezierPath_RoundedRect fill];
    [bezierPath_RoundedCornerRect fill];
    //[bezierPath_ArcCenter fill];
    //[bezierPath_CGPath fill];

    //选择线条颜色
    [[UIColor blackColor] set];
    [bezierPath_rect stroke];
    [bezierPath_oval stroke];
    [bezierPath_RoundedRect stroke];
    [bezierPath_RoundedCornerRect stroke];
    [bezierPath_ArcCenter stroke];
    [bezierPath stroke];
    [bezierPath_CGPath stroke];


    //
    CALayer* aniLayer = [CALayer layer];
    aniLayer.backgroundColor = [UIColor redColor].CGColor;
    aniLayer.position = CGPointMake(10, 520);
    aniLayer.bounds = CGRectMake(0, 0, 8, 8);
    aniLayer.cornerRadius = 4;
    [self.layer addSublayer:aniLayer];
    //
    CAKeyframeAnimation* keyFrameAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAni.repeatCount = NSIntegerMax;
    keyFrameAni.path = bezierPath.CGPath;
    keyFrameAni.duration = 15;
    keyFrameAni.beginTime = CACurrentMediaTime() + 1;
    [aniLayer addAnimation:keyFrameAni forKey:@"keyFrameAnimation"];

}


/*
 animationWithKeyPath的值：

 transform.scale = 比例轉換

 transform.scale.x = 闊的比例轉換

 transform.scale.y = 高的比例轉換

 transform.rotation.z = 平面圖的旋轉

 opacity = 透明度

 margin

 zPosition

 backgroundColor    背景颜色

 cornerRadius    圆角

 borderWidth

 bounds

 contents

 contentsRect

 cornerRadius

 frame

 hidden

 mask

 masksToBounds

 opacity

 position

 shadowColor

 shadowOffset

 shadowOpacity

 shadowRadius
 */


@end
