//
//  ViewController.m
//  四个按钮
//
//  Created by tangtianshi on 2017/5/12.
//  Copyright © 2017年 YH. All rights reserved.
//

#import "ViewController.h"
#import "UIView+IMB.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *fristButton;
@property (weak, nonatomic) IBOutlet UIImageView *addImageVieew;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_fristButton enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self performSelector:@selector(showAnimation:) withObject:obj afterDelay:0.17f*(idx+1)];
        UIButton * button = obj;
        [button cornerViewWithRadius:button.frame.size.width/2.0];
//        SATopButton *button = obj;
//        [button addTarget:self action:@selector(topBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }];
}

- (void)showAnimation:(UIButton *)btn
{
    NSMutableArray *values = [NSMutableArray array];

    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.4, 0.4, 0.4)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.3, 1.3, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.7, 0.7, 0.7)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    [btn.titleLabel showBounceAnimationWithValues:values duration:0.38];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)image3DClick:(UIButton *)sender {
    self.addImageVieew.hidden = NO;
    self.addImageVieew.layer.transform = CATransform3DMakeScale(3, 3, 3);
    [UIView animateWithDuration:0.3 animations:^{
        // self.adoptImageView.transform = CGAffineTransformIdentity;
        self.addImageVieew.layer.transform = CATransform3DIdentity;
    } completion:NULL];
}


@end
