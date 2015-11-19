//
//  ProfileViewController.m
//  Samples3D-ObjC
//
//  Created by Edgar on 11/18/15.
//  Copyright © 2015 hunk. All rights reserved.
//

#import "ProfileViewController.h"
#import "AppDelegate.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

-(NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    
    if (!self.hasOptions) {
        return @[];
    }
    
    UIPreviewAction *preview = [UIPreviewAction actionWithTitle:@"Change background color" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(tapPreviewActionItem:)]) {
            [self.delegate tapPreviewActionItem:action];
        }
        
    }];
    
    UIPreviewAction *preview2 = [UIPreviewAction actionWithTitle:@"Push View" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(tapPreviewActionItem:)]) {
            [self.delegate tapPreviewActionItem:action];
        }
    }];
    
    UIPreviewAction *preview3 = [UIPreviewAction actionWithTitle:@"Alert item" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(tapPreviewActionItem:)]) {
            [self.delegate tapPreviewActionItem:action];
        }
        
    }];
    
    UIPreviewAction *inGroup1 = [UIPreviewAction actionWithTitle:@"Push since preview action" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        AppDelegate* aDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        UITabBarController *tabController = (UITabBarController*)aDelegate.window.rootViewController;
        
        if ([tabController.selectedViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *currentNav = (UINavigationController*)tabController.selectedViewController;
            [currentNav pushViewController:previewViewController animated:true];
        }

    }];
    
    UIPreviewAction *inGroup2 = [UIPreviewAction actionWithTitle:@"Item inside the group 2" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {

    }];
    
    UIPreviewActionGroup *group = [UIPreviewActionGroup actionGroupWithTitle:@"Group" style:UIPreviewActionStyleDefault actions:@[inGroup1,inGroup2]];
    
    return @[preview,preview2,preview3,group];
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
