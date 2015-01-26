//
//  PDFViewController.m
//  PDFDownloader
//
//  Created by Victor Carreño on 7/14/14.
//  Copyright (c) 2014 Victor Carreño. All rights reserved.
//

#import "PDFViewController.h"

@interface PDFViewController ()

@end

@implementation PDFViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Creating file manager and file path
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSArray *resultArray = [fileManager subpathsOfDirectoryAtPath:documentsDirectory error:nil];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:[resultArray objectAtIndex:_detailItem.row]];
    
    // Now create Request for the file that was saved in your documents folder

    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webView setUserInteractionEnabled:YES];
    [_webView setDelegate:self];
    [_webView loadRequest:requestObj];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
