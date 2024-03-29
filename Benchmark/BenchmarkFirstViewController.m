//
//  BenchmarkFirstViewController.m
//  Benchmark
//
//  Created by Wang Yazhou on 5/6/14.
//  Copyright (c) 2014 Wang Yazhou. All rights reserved.
//

#import "BenchmarkFirstViewController.h"

@interface BenchmarkFirstViewController ()

@property (nonatomic, strong) NSArray *albums;
@property (nonatomic, strong) NSArray *searchResults;

@end

@implementation BenchmarkFirstViewController

@synthesize albums = _albums;
@synthesize searchResults = _searchResults;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    _albums = [NSArray arrayWithContentsOfFile:filePath];
    
    // For refresh
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    [refreshControl addTarget:self action:@selector(refreshMyTable:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"专辑";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return _searchResults.count;
    } else {
        return _albums.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *album = [_albums objectAtIndex:indexPath.row];
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        album = [_searchResults objectAtIndex:indexPath.row];
    }
    cell.textLabel.text = [album objectForKey:@"name"];
    cell.detailTextLabel.text = [album objectForKey:@"artist"];
    cell.imageView.image = [UIImage imageNamed:[album objectForKey:@"cover"]];
    
    return cell;
}

// For Search

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
    _searchResults = [_albums filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
            scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                objectAtIndex:[self.searchDisplayController.searchBar
                selectedScopeButtonIndex]]];
   
    return YES;
}

// For refresh
- (void) refreshMyTable: (UIRefreshControl *)refreshControl {
    // set a 2 seconds delay to mimic the refresh behavior
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 2);
    dispatch_after(delay, dispatch_get_main_queue(), ^(void){
        [refreshControl endRefreshing];
    });
}



@end
