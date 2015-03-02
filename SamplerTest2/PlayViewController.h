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
    IBOutlet UILabel *label;
    AVAudioPlayer *avPlayer[50];
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
    int dataNumberOfButton1;
    NSUserDefaults *savedName;

}
//@property int situation;

-(IBAction)recButton:(id)sender;
-(IBAction)addButton:(id)sender;
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
