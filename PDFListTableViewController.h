//
//  PDFListTableViewController.h
//  PDFDownloader
//
//  Created by Victor Carreño on 7/14/14.
//  Copyright (c) 2014 Victor Carreño. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDFListTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSArray  *yourFolderContents;
@property (strong, nonatomic) IBOutlet UITableView *currenTableView;

@end
