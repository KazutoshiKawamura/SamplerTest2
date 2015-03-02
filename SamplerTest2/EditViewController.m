//
//  EditViewController.m
//  SamplerTest2
//
//  Created by kztskawamu on 2015/02/25.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import "EditViewController.h"
#import "CDRTranslucentSideBar.h"

@interface EditViewController ()
@property (nonatomic, strong) CDRTranslucentSideBar *sideBar;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Create SideBar and Set Properties
    self.sideBar = [[CDRTranslucentSideBar alloc] init];
    self.sideBar.sideBarWidth = 200;
    self.sideBar.delegate = self;
//    self.sideBar.translucentStyle = UIBarStyleBlack;
    self.sideBar.tag = 0;
    
    
    // Create Content of SideBar
    UITableView *tableView = [[UITableView alloc] init];
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, tableView.bounds.size.height)];
    v.backgroundColor = [UIColor clearColor];
    [tableView setTableHeaderView:v];
    [tableView setTableFooterView:v];
    
    //If you create UITableViewController and set datasource or delegate to it, don't forget to add childcontroller to this viewController.
    //[[self addChildViewController: @"your view controller"];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    // Set ContentView in SideBar
    [self.sideBar setContentViewInSideBar:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)OnSideBarButtonTapped:(id)sender{
    	[self.sideBar show];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//------------------------------------------

#pragma mark - CDRTranslucentSideBarDelegate
- (void)sideBar:(CDRTranslucentSideBar *)sideBar didAppear:(BOOL)animated {
    if (sideBar.tag == 0) {
        NSLog(@"Left SideBar did appear");
    }
    
    if (sideBar.tag == 1) {
        NSLog(@"Right SideBar did appear");
    }
}

- (void)sideBar:(CDRTranslucentSideBar *)sideBar willAppear:(BOOL)animated {
    if (sideBar.tag == 0) {
        NSLog(@"Left SideBar will appear");
    }
    
    if (sideBar.tag == 1) {
        NSLog(@"Right SideBar will appear");
    }
}

- (void)sideBar:(CDRTranslucentSideBar *)sideBar didDisappear:(BOOL)animated {
    if (sideBar.tag == 0) {
        NSLog(@"Left SideBar did disappear");
    }
    
    if (sideBar.tag == 1) {
        NSLog(@"Right SideBar did disappear");
    }
}

- (void)sideBar:(CDRTranslucentSideBar *)sideBar willDisappear:(BOOL)animated {
    if (sideBar.tag == 0) {
        NSLog(@"Left SideBar will disappear");
    }
    
    if (sideBar.tag == 1) {
        NSLog(@"Right SideBar will disappear");
    }
}

// This is just a sample for tableview menu
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    else if (section == 1) {
        return 20;
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        // StatuBar Height
        return 0;
    }
    else if (section == 1) {
        return 64;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        UIView *clearView = [[UIView alloc] initWithFrame:CGRectZero];
        clearView.backgroundColor = [UIColor clearColor];
        return clearView;
    }
    else if (section == 1) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 44
                                                                      )];
        headerView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, tableView.bounds.size.width - 15, 80)];
        UIView *separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, tableView.bounds.size.width, 0.5f)];
        separatorLineView.backgroundColor = [UIColor blackColor];
        [headerView addSubview:separatorLineView];
        label.text = @"Choose Edit File";
        label.textColor = [UIColor whiteColor];
        [headerView addSubview:label];
        return headerView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 0;
    }
    else if (indexPath.section == 1) {
        return 44;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    if (indexPath.section == 0) {
        return cell;
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"Menu 1";
        }
        else if (indexPath.row == 1) {
            cell.textLabel.text = @"Menu 2";
        }
        else if (indexPath.row == 2) {
            cell.textLabel.text = @"Menu 3";
        }
        else if (indexPath.row == 3) {
            cell.textLabel.text = @"Menu 4";
        }
        else if (indexPath.row == 4) {
            cell.textLabel.text = @"Menu 5";
        }
        else if (indexPath.row == 5) {
            cell.textLabel.text = @"Menu 6";
        }
        else if (indexPath.row == 6) {
            cell.textLabel.text = @"Menu 7";
        }
        else if (indexPath.row == 7) {
            cell.textLabel.text = @"Menu 8";
        }
        else if (indexPath.row == 8) {
            cell.textLabel.text = @"Menu 9";
        }
        else if (indexPath.row == 9) {
            cell.textLabel.text = @"Menu 10";
        }
        else if (indexPath.row == 10) {
            cell.textLabel.text = @"Menu 11";
        }
        else if (indexPath.row == 11) {
            cell.textLabel.text = @"Menu 12";
        }
        else if (indexPath.row == 12) {
            cell.textLabel.text = @"Menu 13";
        }
        else if (indexPath.row == 13) {
            cell.textLabel.text = @"Menu 14";
        }
        else if (indexPath.row == 14) {
            cell.textLabel.text = @"Menu 15";
        }
        else if (indexPath.row == 15) {
            cell.textLabel.text = @"Menu 16";
        }
        else if (indexPath.row == 16) {
            cell.textLabel.text = @"Menu 17";
        }
        else if (indexPath.row == 17) {
            cell.textLabel.text = @"Menu 18";
        }
        else if (indexPath.row == 18) {
            cell.textLabel.text = @"Menu 19";
        }
        else if (indexPath.row == 19) {
            cell.textLabel.text = @"Menu 20";
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}


@end

