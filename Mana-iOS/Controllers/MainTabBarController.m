//
//  MainTabBarController.m
//  Mana-iOS
//
//  Created by Oleksandr Burla on 4/11/16.
//  Copyright © 2016 DB2. All rights reserved.
//

#import "MainTabBarController.h"
#import "BaseNavigationController.h"
#import "UIColor+CustomColors.h"



@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    if ([[TokenModel sharedInstance].token isEqualToString:@""]) {
//        [self pushToStartViewController];
//    }
    
    
    [self prepareUI];
    [self loadUser];
}

#pragma mark - Private

- (void)prepareUI {
    self.tabBar.barTintColor=[UIColor colorWithRed:0.34 green:0.67 blue:0.87 alpha:1.0];
    self.tabBar.tintColor=[UIColor blueColorMy];
    for (UITabBarItem *item in self.tabBar.items) {
        item.image = [item.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
    
    
}

- (void)pushToStartViewController {
    BaseNavigationController *mainController = [self.storyboard instantiateViewControllerWithIdentifier:@"StartNavigationController"];
    [UIView transitionWithView:[[UIApplication sharedApplication] delegate].window
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        [[[UIApplication sharedApplication] delegate].window setRootViewController:mainController];
                    }
                    completion:nil];
}

- (void)loadUser {
    //__weak typeof(self)weakSelf = self;
//    [[NetworkManager sharedManager] getUserWithCompletion:^(BOOL success, id response, NSError *error) {
//        if (success) {
//            UserModel *user = response;
//            
//            [[DataManager sharedManager] setActiveUserID:[user.userId stringValue]];
//            AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//            
//            [delegate sinchClientWithUserId:[user.userId stringValue]];
//            
//            NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
//            
//            NSError *error = nil;
//            NSArray *results = [[[CoreDataManager sharedManager] managedObjectContext] executeFetchRequest:request error:&error];
//            
//            if (error) {
//                NSLog(error.localizedDescription);
//            }
//            
//            if (results.count == 0) {
//                
//                User *coreDataUser = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:[CoreDataManager sharedManager].managedObjectContext];
//                coreDataUser.username = user.userName;
//                coreDataUser.avatar = user.avatarURL;
//                coreDataUser.messages = [[NSMutableDictionary alloc] init];
//                
//                [[CoreDataManager sharedManager] saveContext];
//            } else{
//                NSLog(@"CRASH");
//            }
//        }
//    }];
}

@end
