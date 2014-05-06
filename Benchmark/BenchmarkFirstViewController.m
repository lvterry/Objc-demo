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

@end

@implementation BenchmarkFirstViewController

@synthesize albums = _albums;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    _albums = [NSArray arrayWithContentsOfFile:filePath];
    
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
    return _albums.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *album = [_albums objectAtIndex:indexPath.row];
    cell.textLabel.text = [album objectForKey:@"name"];
    cell.detailTextLabel.text = [album objectForKey:@"artist"];
    cell.imageView.image = [UIImage imageNamed:[album objectForKey:@"cover"]];
    
    return cell;

}

@end
