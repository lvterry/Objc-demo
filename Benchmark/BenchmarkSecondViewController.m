//
//  BenchmarkSecondViewController.m
//  Benchmark
//
//  Created by Wang Yazhou on 5/6/14.
//  Copyright (c) 2014 Wang Yazhou. All rights reserved.
//

#import "BenchmarkSecondViewController.h"

@interface BenchmarkSecondViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@end

@implementation BenchmarkSecondViewController

@synthesize webView = _webView;
@synthesize activityIndicatorView = _activityIndicatorView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:@"http://baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView scalesPageToFit];
    [_webView loadRequest:request];
    _webView.delegate = self;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [_activityIndicatorView stopAnimating];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
