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
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    _yourFolderContents = [fileManager subpathsOfDirectoryAtPath:documentsDirectory error:nil];

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

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
        ///Delete Object
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
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
                              stringByAppendingPathComponent:[yourFolderContents objectAtIndex:indexPath.row]];
        

        if (error){
            NSLog(@"%@", error);
        }

        [fileManager removeItemAtPath:filePath error:&error];
        [_yourFolderContents removeObjectAtIndex:indexPath.row];
        //[_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [_currenTableView reloadData];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

@end
