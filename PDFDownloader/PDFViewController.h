//
//  PDFViewController.h
//  PDFDownloader
//
//  Created by Victor Carreño on 7/14/14.
//  Copyright (c) 2014 Victor Carreño. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDFViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSIndexPath *detailItem;

@end
