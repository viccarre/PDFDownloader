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
        
        // Update the view.
        //[self configureView];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSError *error = nil;
    
    NSString *yourFolderPath = [[NSString alloc] initWithString:[
                                                                 [[[NSBundle mainBundle] resourcePath] stringByDeletingLastPathComponent]
                                                                 stringByAppendingPathComponent:@"Documents"
                                                                 ]];
    
    NSArray  *yourFolderContents = [[NSFileManager defaultManager]
                                    contentsOfDirectoryAtPath:yourFolderPath error:&error];
    
    NSString *resourceDocPath = [[NSString alloc] initWithString:[
                                                                  [[[NSBundle mainBundle] resourcePath] stringByDeletingLastPathComponent]
                                                                  stringByAppendingPathComponent:@"Documents"
                                                                  ]];
    NSString *filePath = [resourceDocPath
                          stringByAppendingPathComponent:[yourFolderContents objectAtIndex:_detailItem.row]];
    
    // Now create Request for the file that was saved in your documents folder
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webView setUserInteractionEnabled:YES];
    [_webView setDelegate:self];
    [_webView loadRequest:requestObj];
    

    
    
    NSLog(@"Number of shows: %lu", (unsigned long)[yourFolderContents count]);
    
    
    NSLog(@"%ld", (long)_detailItem.row);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
