//
//  PDFListTableViewController.m
//  PDFDownloader
//
//  Created by Victor Carreño on 7/14/14.
//  Copyright (c) 2014 Victor Carreño. All rights reserved.
//

#import "PDFListTableViewController.h"
#import "PDFViewController.h"

@interface PDFListTableViewController ()

@end

@implementation PDFListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSError *error = nil;
    
    NSString *yourFolderPath = [[NSString alloc] initWithString:[
                                                                 [[[NSBundle mainBundle] resourcePath] stringByDeletingLastPathComponent]
                                                                 stringByAppendingPathComponent:@"Documents"
                                                                 ]];
    
    _yourFolderContents = [[NSFileManager defaultManager]
                                    contentsOfDirectoryAtPath:yourFolderPath error:&error];
    NSLog(@"Number of shows: %lu", (unsigned long)[_yourFolderContents count]);
    NSLog( [_yourFolderContents objectAtIndex:0]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_yourFolderContents count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...

    cell.textLabel.text = [_yourFolderContents objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showPDF"]) {
        
        PDFViewController *detaildestination = [segue destinationViewController];
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        [detaildestination setDetailItem:indexPath];
        
    }
}


@end
