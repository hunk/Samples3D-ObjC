//
//  TabThreeViewController.m
//  Samples3D-ObjC
//
//  Created by Edgar on 11/19/15.
//  Copyright © 2015 hunk. All rights reserved.
//

#import "TabThreeViewController.h"
//#import <QuartzCore/QuartzCore.h>

@interface TabThreeViewController ()
@property (strong, nonatomic) IBOutlet UIView *targetView;
@property (assign, nonatomic) BOOL have3Dsupport;

@property (strong, nonatomic) IBOutlet UILabel *forceLabel;
@end

@implementation TabThreeViewController

-(void)check3DTouch{
    
    self.have3Dsupport = false;
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable && [self.traitCollection
                                                                                         respondsToSelector:@selector(forceTouchCapability)]) {
        
        self.have3Dsupport = true;
    }else{
        NSLog(@"This device dont have support for 3D Touch");
    }

}

-(void)setOpacityForTargetView:(CGFloat)opacity animate:(BOOL)animate {
    
    if (animate) {
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
        anim.fromValue = [NSNumber numberWithFloat:self.targetView.layer.shadowOpacity];
        anim.toValue = [NSNumber numberWithFloat:0.0];
        anim.duration = 1.0;
        [self.targetView.layer addAnimation:anim forKey:@"shadowOpacity"];
        self.targetView.layer.shadowOpacity = 0.0;
        
    } else {
        [self.targetView.layer removeAllAnimations];
        self.targetView.layer.masksToBounds = NO;
        self.targetView.layer.shadowRadius = 10;
        self.targetView.layer.shadowOpacity = opacity;
    }
    
    self.targetView.layer.shadowColor = [UIColor blueColor].CGColor;
    
    self.forceLabel.text = [NSString stringWithFormat:@"Force: %.2f %%",opacity*100];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    if (!self.have3Dsupport) {
        return;
    }
    
    UITouch *touch = [touches anyObject];
    CGFloat opacity = (touch.force / touch.maximumPossibleForce);
    [self setOpacityForTargetView:opacity animate:false];
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (!self.have3Dsupport) {
        return;
    }
    
    UITouch *touch = [touches anyObject];
    CGFloat opacity = (touch.force / touch.maximumPossibleForce);
    [self setOpacityForTargetView:opacity animate:false];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    if (!self.have3Dsupport) {
        return;
    }
    
    [self setOpacityForTargetView:0.0 animate:true];

}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    if (!self.have3Dsupport) {
        return;
    }
    
    [self setOpacityForTargetView:0.0 animate:true];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self check3DTouch];
    [self setOpacityForTargetView:0.0 animate:false];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
