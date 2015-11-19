//
//  ProfileViewController.h
//  Samples3D-ObjC
//
//  Created by Edgar on 11/18/15.
//  Copyright © 2015 hunk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProfileViewController;

@protocol ProfileViewControllerDelegate <NSObject>

@optional
-(void)tapPreviewActionItem:(UIPreviewAction*)action;

@end


@interface ProfileViewController : UIViewController

@property (nonatomic, assign) id  delegate;
@property (nonatomic, assign) BOOL hasOptions;

@end
