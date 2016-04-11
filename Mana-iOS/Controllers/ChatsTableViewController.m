//
//  ChatsTableViewController.m
//  Mana-iOS
//
//  Created by Oleksandr Burla on 4/11/16.
//  Copyright © 2016 DB2. All rights reserved.
//

#import "ChatsTableViewController.h"
#import "ChatTableViewCell.h"

@interface ChatsTableViewController ()

@property (assign, nonatomic) NSInteger countOfRow;
@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) UIView *defaultTitleView;

@end

@implementation ChatsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareUI];
    
    self.countOfRow = 15;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareUI {
    self.title = @"Chats";
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.countOfRow;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chatCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        self.countOfRow--; // удалить с массива

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
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

- (IBAction)addChat:(UIBarButtonItem *)sender {
    NSLog(@"Add chats");
}




@end
