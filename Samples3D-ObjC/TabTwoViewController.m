//
//  TabTwoViewController.m
//  Samples3D-ObjC
//
//  Created by Edgar on 11/19/15.
//  Copyright © 2015 hunk. All rights reserved.
//

#import "TabTwoViewController.h"
#import "InfoRowViewController.h"

@interface TabTwoViewController ()<UIViewControllerPreviewingDelegate>

@end

@implementation TabTwoViewController

#pragma mark Preview methods delegate
-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    if (indexPath) {
        UIStoryboard *MainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        InfoRowViewController *infoVC = (InfoRowViewController*)[MainStoryboard instantiateViewControllerWithIdentifier: @"InfoRowViewController"];
        infoVC.cellInformation = [NSString stringWithFormat:@"Section %zd Row %zd",indexPath.section,indexPath.row];
        
        infoVC.preferredContentSize = CGSizeMake(self.view.bounds.size.width, 100);
        
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        previewingContext.sourceRect = cell.frame;
        
        return infoVC;
    }
    
    return nil;
}

-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    
    [self presentViewController:viewControllerToCommit animated:true completion:nil];
    
}

-(void)check3DTouch{
    
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable && [self.traitCollection
                                                                                         respondsToSelector:@selector(forceTouchCapability)]) {
        
        [self registerForPreviewingWithDelegate:self sourceView:self.view];
    }else{
        NSLog(@"This device dont have support for 3D Touch");
    }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self check3DTouch];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"Section %zd row %zd",indexPath.section,indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
