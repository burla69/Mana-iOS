//
//  ChangeNameViewController.m
//  Mana-iOS
//
//  Created by Oleksandr Burla on 4/12/16.
//  Copyright © 2016 DB2. All rights reserved.
//

#import "ChangeNameViewController.h"

@interface ChangeNameViewController ()

@end

@implementation ChangeNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButton:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    //тут отправить имя на сервер
    
    NSLog(@"save name");
}

@end
