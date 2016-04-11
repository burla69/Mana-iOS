//
//  ClassesViewController.m
//  Mana-iOS
//
//  Created by Oleksandr Burla on 4/11/16.
//  Copyright © 2016 DB2. All rights reserved.
//

#import "ClassesViewController.h"
#import "ClassTableViewCell.h"

@interface ClassesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) UIView *defaultTitleView;



@end

@implementation ClassesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareUI];
    self.defaultTitleView = self.navigationItem.titleView;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareUI {
    self.title = @"Classes";
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ClassTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"classCell" forIndexPath:indexPath];
    
    
    
    return cell;
}


- (IBAction)searchTouched:(id)sender {

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"delete"] style:UIBarButtonItemStylePlain target:self action:@selector(closeTouched:)];
    
    self.definesPresentationContext = YES;
    self.navigationItem.titleView = self.searchController.searchBar;

}

#pragma mark - Initialization

- (UISearchController *)searchController {
    if (_searchController == nil) {
        _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
        _searchController.searchResultsUpdater = self;
        _searchController.delegate = self;
        _searchController.searchBar.delegate = self;
        _searchController.searchBar.placeholder = @"Search something...";
        _searchController.searchBar.tintColor = [UIColor grayColor];
        
        
        _searchController.hidesNavigationBarDuringPresentation = NO;
        _searchController.dimsBackgroundDuringPresentation = YES;
    }
    
    return _searchController;
}

- (void)closeTouched:(id)sender {
    self.navigationItem.titleView = self.defaultTitleView;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(searchTouched:)];
}

#pragma mark - UISearchControllerDelegate

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}




@end
