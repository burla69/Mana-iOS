//
//  AllUsersTableViewController.m
//  Mana-iOS
//
//  Created by Oleksandr Burla on 4/12/16.
//  Copyright © 2016 DB2. All rights reserved.
//

#import "AllUsersTableViewController.h"
#import "AllUsersTableViewCell.h"

@interface AllUsersTableViewController ()

@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) UIView *defaultTitleView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationItem;

@end

@implementation AllUsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)prepareUI {
    self.title = @"Add New Chat";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 16;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AllUsersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"allUsersCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


#pragma mark - Search


- (IBAction)searchTouched:(id)sender {
    
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"delete"] style:UIBarButtonItemStylePlain target:self action:@selector(closeTouched:)];
    
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
    
    NSLog(@"closeTouched");
}

#pragma mark - UISearchControllerDelegate

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.navigationItem.titleView = self.defaultTitleView;
    NSLog(@"searchBarCancelButtonClicked");
}


@end
