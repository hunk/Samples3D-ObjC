//
//  TabOneViewController.m
//  Samples3D-ObjC
//
//  Created by Edgar on 11/17/15.
//  Copyright © 2015 hunk. All rights reserved.
//

#import "TabOneViewController.h"
#import "ProfileViewController.h"

@interface TabOneViewController () <UIViewControllerPreviewingDelegate,ProfileViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UIView *onlyPeek;
@property (strong, nonatomic) IBOutlet UIView *peekAndPop;
@property (strong, nonatomic) IBOutlet UIView *peekAndPopWithOptions;
@property (strong, nonatomic) IBOutlet UIView *differentViews;

@end

@implementation TabOneViewController

-(void)tapPreviewActionItem:(UIPreviewAction *)action{
    
    if ([action.title isEqualToString:@"Change background color"]) {
        CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
        UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        self.view.backgroundColor = color;
    } else if ( [action.title isEqualToString:@"Alert item"] ){
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Some action"
                                              message:@"A message"
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:@"Ok"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       
                                       
                                   }];
        
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    } else {
        UIStoryboard *MainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ProfileViewController *profile = (ProfileViewController*)[MainStoryboard instantiateViewControllerWithIdentifier: @"ProfileViewController"];
        [self.navigationController pushViewController:profile animated:true];
    }
}


#pragma mark Preview methods delegate
-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    
    BOOL withOptions = false;

    if (previewingContext.sourceView == self.peekAndPopWithOptions || previewingContext.sourceView == self.differentViews){
        withOptions = true;
    }
    
    UIStoryboard *MainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ProfileViewController *profile = (ProfileViewController*)[MainStoryboard instantiateViewControllerWithIdentifier: @"ProfileViewController"];
    profile.delegate = self;
    profile.hasOptions = withOptions;
    
    return profile;
}

-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    
    if (previewingContext.sourceView == self.peekAndPop || previewingContext.sourceView == self.peekAndPopWithOptions ) {
        
        [self.navigationController pushViewController:viewControllerToCommit animated:true];
        
    } else if (previewingContext.sourceView == self.differentViews){
        
        UIStoryboard *MainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *anotherView = (UIViewController*)[MainStoryboard instantiateViewControllerWithIdentifier: @"AnotherView"];
        [self.navigationController pushViewController:anotherView animated:true];
        
    }
    
}

-(void)check3DTouch{
    
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable && [self.traitCollection
                                                                                         respondsToSelector:@selector(forceTouchCapability)]) {
        
        [self registerForPreviewingWithDelegate:self sourceView:self.onlyPeek];
        [self registerForPreviewingWithDelegate:self sourceView:self.peekAndPop];
        [self registerForPreviewingWithDelegate:self sourceView:self.peekAndPopWithOptions];
        [self registerForPreviewingWithDelegate:self sourceView:self.differentViews];
    }else{
        NSLog(@"This device dont have support for 3D Touch");
    }
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self check3DTouch];
    // Do any additional setup after loading the view.
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
