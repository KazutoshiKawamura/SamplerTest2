//
//  PlayViewController.h
//  SamplerTest2
//
//  Created by kztskawamu on 2015/02/25.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "FileTableViewController.h"


@interface PlayViewController : UIViewController{
    AVAudioPlayer *avPlayer[50];
    int selectedFileNumber;
//    NSString *labelName[9];
    IBOutlet UILabel *label0;
    IBOutlet UILabel *label1;
    IBOutlet UILabel *label2;
    IBOutlet UILabel *label3;
    IBOutlet UILabel *label4;
    IBOutlet UILabel *label5;
    IBOutlet UILabel *label6;
    IBOutlet UILabel *label7;
    IBOutlet UILabel *label8;
    int fileNumberOfButton[9];
    int dataNumber;
    int playCount;
    bool addMode;
    IBOutlet UIButton *addButton1;
    IBOutlet UIButton *addButton2;
    IBOutlet UIButton *addButton3;
    IBOutlet UIButton *addButton4;
    IBOutlet UIButton *addButton5;
    IBOutlet UIButton *addButton6;
    IBOutlet UIButton *addButton7;
    IBOutlet UIButton *addButton8;
    IBOutlet UIButton *addButton9;
    IBOutlet UIButton *recButton;
    IBOutlet UIButton *addModeButton;
    IBOutlet UIButton *editButton;
    IBOutlet UIButton *addCancelButton;
    int dataNumberOfButton1;
    NSUserDefaults *savedName;

}
//@property int situation;

-(IBAction)rec;
-(IBAction)add;
-(IBAction)addCancel;
-(IBAction)playButtonAction1;
-(IBAction)playButtonAction2;
-(IBAction)playButtonAction3;
-(IBAction)playButtonAction4;
-(IBAction)playButtonAction5;
-(IBAction)playButtonAction6;
-(IBAction)playButtonAction7;
-(IBAction)playButtonAction8;
-(IBAction)playButtonAction9;
-(IBAction)addButtonAction1;
-(IBAction)addButtonAction2;
-(IBAction)addButtonAction3;
-(IBAction)addButtonAction4;
-(IBAction)addButtonAction5;
-(IBAction)addButtonAction6;
-(IBAction)addButtonAction7;
-(IBAction)addButtonAction8;
-(IBAction)addButtonAction9;
-(void)playButtonAction:(int)data;
-(void)addButtonAction:(int)buttonNumber;

@end
