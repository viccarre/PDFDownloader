//
//  BrowserViewController.m
//  PDFDownloader
//
//  Created by Victor Carreño on 7/13/14.
//  Copyright (c) 2014 Victor Carreño. All rights reserved.
//

#import "BrowserViewController.h"

@interface BrowserViewController ()

@end

@implementation BrowserViewController

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
    _webView.delegate = self;
    [self loadRequestFromString:@"https://www.google.com"];
    [_loadingIndicator startAnimating];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToURL:(id)sender {
    
    [self loadRequestFromString:_urltextbox.text];
    [_urltextbox resignFirstResponder];
}

- (void)loadRequestFromString:(NSString*)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSLog(@"Web View was loaded");
    [_loadingIndicator stopAnimating];
    _loadingIndicator.hidden = YES;
}
@end
