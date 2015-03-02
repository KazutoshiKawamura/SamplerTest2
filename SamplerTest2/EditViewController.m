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
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)SelectFile{
    FileTableViewController *tableVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"FileTableViewController"];
    tableVC.situation = 2;
    [self presentViewController:tableVC animated:YES completion:nil];//YESならModal,Noなら何もなし
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

@end

