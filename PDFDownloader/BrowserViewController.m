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
    
    NSError *error = nil;
    
    NSString *yourFolderPath = [[NSString alloc] initWithString:[
                                                                 [[[NSBundle mainBundle] resourcePath] stringByDeletingLastPathComponent]
                                                                 stringByAppendingPathComponent:@"Documents"
                                                                 ]];
    
    NSArray  *yourFolderContents = [[NSFileManager defaultManager]
                                    contentsOfDirectoryAtPath:yourFolderPath error:&error];
    NSLog(@"Number of shows: %lu", (unsigned long)[yourFolderContents count]);
    
    
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
    
   // NSLog(_webView.request.URL.absoluteString);
    _urltextbox.text = _webView.request.URL.absoluteString;
}


- (IBAction)savePDF:(id)sender {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Enter name for Document" message:@"Make sure to save a PDF file." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alertView show];
    

    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UITextField *name = [alertView textFieldAtIndex:0];
    NSLog(@"%@",name.text);
    
    // Get the PDF Data from the url in a NSData Object
    NSData *pdfData = [[NSData alloc] initWithContentsOfURL:[
                                                             NSURL URLWithString:_webView.request.URL.absoluteString]];
    // Store the Data locally as PDF File
    NSString *resourceDocPath = [[NSString alloc] initWithString:[
                                                                  [[[NSBundle mainBundle] resourcePath] stringByDeletingLastPathComponent]
                                                                  stringByAppendingPathComponent:@"Documents"
                                                                  ]];
    NSString *filePath = [resourceDocPath
                          stringByAppendingPathComponent:[name.text stringByAppendingString:@".pdf"]];
    [pdfData writeToFile:filePath atomically:YES];
    
}

- (IBAction)back:(id)sender {
    
    if ([_webView canGoBack]) {
        [_webView goBack];
    }
    
}

- (IBAction)refresh:(id)sender {
    [_webView reload];
}
@end
