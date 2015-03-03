//
//  PlayViewController.m
//  SamplerTest2
//
//  Created by kztskawamu on 2015/02/25.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import "PlayViewController.h"

@interface PlayViewController ()

@end

@implementation PlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    savedName = [NSUserDefaults standardUserDefaults];
    NSString *name1 = [savedName stringForKey:@"NAME"];
    label.text=name1;
    dataNumber = [savedName integerForKey:@"DATA_NUMBER"];
    dataNumberOfButton1 = 0;
    playCount = 0;
    addButton1.hidden=true;
    addButton2.hidden=true;
    addButton3.hidden=true;
    addButton4.hidden=true;
    addButton5.hidden=true;
    addButton6.hidden=true;
    addButton7.hidden=true;
    addButton8.hidden=true;
    addButton9.hidden=true;
    recButton.hidden=false;
    addModeButton.hidden=false;
    editButton.hidden=false;
    addCancelButton.hidden=true;
    
    addMode = [savedName boolForKey:@"ADD_MODE"];
    if (addMode == true) {
        addButton1.hidden=false;
        addButton2.hidden=false;
        addButton3.hidden=false;
        addButton4.hidden=false;
        addButton5.hidden=false;
        addButton6.hidden=false;
        addButton7.hidden=false;
        addButton8.hidden=false;
        addButton9.hidden=false;
        recButton.hidden=true;
        addModeButton.hidden=true;
        editButton.hidden=true;
        addCancelButton.hidden=false;
    }
//    _situation = 0;
}


-(IBAction)button1{
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryAmbient error:nil];
    
    
    // 録音ファイルパス
    NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask,YES);
    NSString *documentDir = [filePaths objectAtIndex:0];
    
    NSString *prePath = [documentDir stringByAppendingPathComponent:@"rec"];
    NSString *path = [prePath stringByAppendingFormat:@"%d.caf",dataNumber];
    
    NSURL *recordingURL = [NSURL fileURLWithPath:path];
    
    avPlayer[playCount] = [[AVAudioPlayer alloc]initWithContentsOfURL:recordingURL error:nil];
    avPlayer[playCount].delegate = self;
    avPlayer[playCount].volume=1.0;
    //        avPlayer[playCount].currentTime = 1.323;
    [avPlayer[playCount] play];
    playCount++;
    if (playCount >= 50) {
        playCount = 0;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)rec{
    FileTableViewController *tableVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"FileTableViewController"];
    tableVC.situation = 1;
    [self presentViewController:tableVC animated:YES completion:nil];//YESならModal,Noなら何もなし
//    FileTableViewController.situation = 1;
//    [self performSegueWithIdentifier:@"toFileTableViewController" sender:self];
}

-(IBAction)add{
    FileTableViewController *tableVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"FileTableViewController"];
    tableVC.situation = 0;
    [self presentViewController:tableVC animated:YES completion:nil];//YESならModal,Noなら何もなし
//    [self performSegueWithIdentifier:@"toFileTableViewController" sender:self];
}

-(IBAction)addCancel{
    addButton1.hidden=true;
    addButton2.hidden=true;
    addButton3.hidden=true;
    addButton4.hidden=true;
    addButton5.hidden=true;
    addButton6.hidden=true;
    addButton7.hidden=true;
    addButton8.hidden=true;
    addButton9.hidden=true;
    recButton.hidden=false;
    addModeButton.hidden=false;
    editButton.hidden=false;
    addCancelButton.hidden=true;
}

-(IBAction)playButtonAction1{
    [self playButtonAction:dataNumberOfButton1];
}

-(IBAction)playButtonAction2{
    
}

-(IBAction)playButtonAction3{
    
}

-(IBAction)playButtonAction4{
    
}

-(IBAction)playButtonAction5{
    
}

-(IBAction)playButtonAction6{
    
}

-(IBAction)playButtonAction7{
    
}

-(IBAction)playButtonAction8{
    
}

-(IBAction)playButtonAction9{
    
}

-(IBAction)addButtonAction1{
    [self addButtonAction:dataNumberOfButton1];
}

-(IBAction)addButtonAction2{
    
}

-(IBAction)addButtonAction3{
    
}

-(IBAction)addButtonAction4{
    
}

-(IBAction)addButtonAction5{
    
}

-(IBAction)addButtonAction6{
    
}

-(IBAction)addButtonAction7{
    
}

-(IBAction)addButtonAction8{
    
}

-(IBAction)addButtonAction9{
    
}


-(void)playButtonAction:(int)data{
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryAmbient error:nil];
    
    
    // 録音ファイルパス
    NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask,YES);
    NSString *documentDir = [filePaths objectAtIndex:0];
    
    NSString *prePath = [documentDir stringByAppendingPathComponent:@"rec"];
    NSString *path = [prePath stringByAppendingFormat:@"%d.caf",data];
    
    NSURL *recordingURL = [NSURL fileURLWithPath:path];
    
    avPlayer[playCount] = [[AVAudioPlayer alloc]initWithContentsOfURL:recordingURL error:nil];
    avPlayer[playCount].delegate = self;
    avPlayer[playCount].volume=1.0;
    //        avPlayer[playCount].currentTime = 1.323;
    [avPlayer[playCount] play];
    playCount++;
    if (playCount >= 50) {
        playCount = 0;
    }
}


-(void)addButtonAction:(int)buttonNumber{
//    buttonNumber =
    addMode = false;
    [savedName setBool:false forKey:@"ADD_MODE"];
    addButton1.hidden=true;
    addButton2.hidden=true;
    addButton3.hidden=true;
    addButton4.hidden=true;
    addButton5.hidden=true;
    addButton6.hidden=true;
    addButton7.hidden=true;
    addButton8.hidden=true;
    addButton9.hidden=true;

}


@end
