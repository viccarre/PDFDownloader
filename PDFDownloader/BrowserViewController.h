//
//  BrowserViewController.h
//  PDFDownloader
//
//  Created by Victor Carreño on 7/13/14.
//  Copyright (c) 2014 Victor Carreño. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowserViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *urltextbox;
- (IBAction)goToURL:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;
- (IBAction)savePDF:(id)sender;

//Web Methods

- (IBAction)back:(id)sender;
- (IBAction)refresh:(id)sender;

@end
