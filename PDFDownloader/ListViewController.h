//
//  ListViewController.h
//  PDFDownloader
//
//  Created by Victor Carreño on 7/15/14.
//  Copyright (c) 2014 Victor Carreño. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSMutableArray  *yourFolderContents;
@property (strong, nonatomic) IBOutlet UITableView *currenTableView;

@end
