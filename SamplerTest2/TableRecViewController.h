//
//  TableRecViewController.h
//  SamplerTest2
//
//  Created by kztskawamu on 2015/03/02.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecViewController.h"

@interface TableRecViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    IBOutlet UILabel *label;
    int number;
}

@property NSMutableArray *rows;
@property IBOutlet UITableView *tableView;
@property int firstNum;

-(IBAction)test:(id)sender;
-(IBAction)testButton:(id)sender;

@end
