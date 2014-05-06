//
//  BenchmarkThirdViewController.m
//  Benchmark
//
//  Created by Wang Yazhou on 5/6/14.
//  Copyright (c) 2014 Wang Yazhou. All rights reserved.
//

#import "BenchmarkThirdViewController.h"

@interface BenchmarkThirdViewController ()

@end

@implementation BenchmarkThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tableViewButtonPressed:(id)sender {
    [[self tabBarController] setSelectedIndex:0];

}
- (IBAction)webViewButtonPressed:(id)sender {
    [[self tabBarController] setSelectedIndex:1];
}

@end
