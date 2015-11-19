//
//  InfoRowViewController.m
//  Samples3D-ObjC
//
//  Created by Edgar on 11/19/15.
//  Copyright © 2015 hunk. All rights reserved.
//

#import "InfoRowViewController.h"

@interface InfoRowViewController ()

@property (strong, nonatomic) IBOutlet UILabel *infoLabel;

@end

@implementation InfoRowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.infoLabel.text = self.cellInformation;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)add:(id)sender {
    
    [self dismissViewControllerAnimated:true completion:nil];
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
