//
//  FileTableViewController.h
//  SamplerTest2
//
//  Created by kztskawamu on 2015/03/02.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    IBOutlet UILabel *titleLabel;
}

@property NSMutableArray *rows;
@property IBOutlet UITableView *tableView;
@property int fileNumber;
@property int situation;    //0 = add, 1 = rec, 2 = edit

-(IBAction)cancelButton:(id)sender;

@end
