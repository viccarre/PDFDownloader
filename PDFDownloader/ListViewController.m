//
//  ListViewController.m
//  PDFDownloader
//
//  Created by Victor Carreño on 7/15/14.
//  Copyright (c) 2014 Victor Carreño. All rights reserved.
//

#import "ListViewController.h"
#import "PDFViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

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
    NSError *error = nil;
    
    NSString *yourFolderPath = [[NSString alloc] initWithString:[
                                                                 [[[NSBundle mainBundle] resourcePath] stringByDeletingLastPathComponent]
                                                                 stringByAppendingPathComponent:@"Documents"
                                                                 ]];
    
    _yourFolderContents = [[NSFileManager defaultManager]
                           contentsOfDirectoryAtPath:yourFolderPath error:&error];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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

-(void)viewWillAppear:(BOOL)animated{
    
    [_currenTableView reloadData];

}


-(void)viewDidAppear:(BOOL)animated{
    [_currenTableView reloadData];
    
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
        
        NSIndexPath *indexPath = [_currenTableView indexPathForSelectedRow];
        
        [detaildestination setDetailItem:indexPath];
        
    }
}

@end
