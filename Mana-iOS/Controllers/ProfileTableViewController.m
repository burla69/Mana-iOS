//
//  ProfileTableViewController.m
//  Mana-iOS
//
//  Created by Oleksandr Burla on 4/12/16.
//  Copyright © 2016 DB2. All rights reserved.
//

#import "ProfileTableViewController.h"
#import "BaseNavigationController.h"

@interface ProfileTableViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIImagePickerController *imagePicker;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@end

@implementation ProfileTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if (indexPath.row == 5) {
        NSLog(@"Sign Out");
        
        //[[TokenModel sharedInstance] clearToken]; // дописать
        
        [self pushToStartViewController];

    }
}



- (IBAction)buttonTouched:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Change Picture" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    __weak typeof(self) weakSelf = self;
    UIAlertAction *chooseExisting = [UIAlertAction actionWithTitle:@"Choose Existing Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        weakSelf.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [weakSelf presentViewController:self.imagePicker animated:YES completion:nil];
    }];
    
    UIAlertAction *takePhoto = [UIAlertAction actionWithTitle:@"Take Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        weakSelf.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [weakSelf presentViewController:self.imagePicker animated:YES completion:nil];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //[weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertController addAction:chooseExisting];
    [alertController addAction:takePhoto];
    [alertController addAction:cancel];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (UIImagePickerController *)imagePicker {
    if (_imagePicker == nil) {
        _imagePicker = [[UIImagePickerController alloc] init];
        _imagePicker.delegate = self;
        _imagePicker.allowsEditing = YES;
    }
    
    return _imagePicker;
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    self.avatarImageView.image = image;
    
//    __weak typeof(self) weakSelf = self;
    
//    [SVProgressHUD show];
//    [[NetworkManager sharedManager] changeAvatarWithBase64String:[image encodeToBase64String] completion:^(BOOL success, id response, NSError *error) {
//        [SVProgressHUD dismiss];
//        
//        if (success) {
//            weakSelf.userImageView.image = image;
//        } else {
//            [UIAlertView alertWithMessage:@"Some error occured!"];
//        }
//        
//    }];
    
    //self.userImageView.image = image;
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveAvatar:(UIButton *)sender {
    
    NSLog(@"save avatar");

}


- (void)pushToStartViewController {
    BaseNavigationController *mainController = [self.storyboard instantiateViewControllerWithIdentifier:@"startNavigationController"];
    [UIView transitionWithView:[[UIApplication sharedApplication] delegate].window
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [[[UIApplication sharedApplication] delegate].window setRootViewController:mainController];
                        });
                    }
                    completion:nil];
}




@end
