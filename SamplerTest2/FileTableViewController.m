//
//  FileTableViewController.m
//  SamplerTest2
//
//  Created by kztskawamu on 2015/03/02.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import "FileTableViewController.h"

#define _STCellId @"Cell"

@interface FileTableViewController ()

@end

@implementation FileTableViewController

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    _rows = [NSMutableArray arrayWithCapacity:100];
    for (int i = 0; i < 100; i++) {
        NSString *title = [NSString stringWithFormat:@"Item %d", i];
        [_rows addObject:title];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:_STCellId];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    if (_situation == 0) {
        titleLabel.text = @"Select Add File";
    }else if (_situation == 1) {
        titleLabel.text = @"Select Rec File";
    }else if (_situation == 2) {
        titleLabel.text = @"Select Edit File";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 21;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%d.", indexPath.row + 1]; // 何番目のセルかを表示させました
    return cell;
}

-(IBAction)cancelButton:(id)sender{
    if (_situation == 0) {
        [self performSegueWithIdentifier:@"toPlayViewController" sender:self];
    }else if (_situation == 1) {
        [self performSegueWithIdentifier:@"toPlayViewController" sender:self];
    }else if (_situation == 2) {
        [self performSegueWithIdentifier:@"toEditViewController" sender:self];
    }
}

#pragma mark - Table view Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_situation == 0) {
        [self performSegueWithIdentifier:@"toPlayViewController" sender:self];
    }else if (_situation == 1) {
        [self performSegueWithIdentifier:@"toRecViewController" sender:self];
    }else if (_situation == 2) {
        [self performSegueWithIdentifier:@"toEditViewController" sender:self];
    }
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
