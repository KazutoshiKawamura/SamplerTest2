//
//  RecViewController.m
//  SamplerTest2
//
//  Created by kztskawamu on 2015/02/25.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import "RecViewController.h"

@interface RecViewController ()

@end

@implementation RecViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    dataNumber = 0;
    buttonCondition = 0;
//    btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(0, 0, 150, 150);
    [btn setImage:[UIImage imageNamed:@"RecStartButton.png"] forState:UIControlStateNormal];
//    [self.view addSubview:btn];
//    [self.view addSubview:btn];
    
}



- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    //    [player release];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    


}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (IBAction)recStartAndStop:(id)sender {
    if (buttonCondition == 0) {
        
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        NSError *error = nil;
        // 使用している機種が録音に対応しているか
        if ([audioSession inputIsAvailable]) {
            [audioSession setCategory:AVAudioSessionCategoryRecord error:&error];
        }
        if(error){
            NSLog(@"audioSession: %@ %d %@", [error domain], [error code], [[error userInfo] description]);
        }
        // 録音機能をアクティブにする
        [audioSession setActive:YES error:&error];
        if(error){
            NSLog(@"audioSession: %@ %d %@", [error domain], [error code], [[error userInfo] description]);
        }
        
        // 録音ファイルパス
        NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                 NSUserDomainMask,YES);
        NSString *documentDir = [filePaths objectAtIndex:0];
        
        NSString *prePath = [documentDir stringByAppendingPathComponent:@"rec"];
        NSString *path = [prePath stringByAppendingFormat:@"%d.caf",dataNumber];
        
        NSURL *recordingURL = [NSURL fileURLWithPath:path];
        
        /*
         
         NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
         [NSNumber numberWithFloat: 44100.0], AVSampleRateKey,
         [NSNumber numberWithInt: kAudioFormatLinearPCM], AVFormatIDKey,
         [NSNumber numberWithInt: 1], AVNumberOfChannelsKey,
         [NSNumber numberWithInt:16], AVLinearPCMBitDepthKey,
         [NSNumber numberWithBool:NO], AVLinearPCMIsBigEndianKey,
         [NSNumber numberWithBool:NO], AVLinearPCMIsFloatKey,
         nil];
         
         AvRecorder = [[AVAudioRecorder alloc] initWithURL:recordingURL settings:settings error:&error];
         */
        
        // 録音中に音量をとる場合はYES
        //    AvRecorder.meteringEnabled = YES;
        
        avRecorder = [[AVAudioRecorder alloc] initWithURL:recordingURL settings:nil error:&error];
        
        if(error){
            NSLog(@"error = %@",error);
            return;
        }
        avRecorder.delegate=self;
        //    ５秒録音して終了
        //    [avRecorder recordForDuration: 5.0];
        
        [avRecorder record];
        
        buttonCondition = 1;
//    UIImage: image = [UIImage imageNamed:@"RecStopButton.png"];
//        [button setImage:image forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:@"RecStopButton.png"] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        
        

    }else if (buttonCondition == 1){
        [avRecorder stop];
        buttonCondition = 2;
        [btn setImage:[UIImage imageNamed:@"PlayButton.png"] forState:UIControlStateNormal];
        [self.view addSubview:btn];
    }else if (buttonCondition == 2){
        
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        [audioSession setCategory:AVAudioSessionCategoryAmbient error:nil];
        
        
        // 録音ファイルパス
        NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                 NSUserDomainMask,YES);
        NSString *documentDir = [filePaths objectAtIndex:0];
        
        NSString *prePath = [documentDir stringByAppendingPathComponent:@"rec"];
        NSString *path = [prePath stringByAppendingFormat:@"%d.caf",dataNumber];
        
        NSURL *recordingURL = [NSURL fileURLWithPath:path];
        
        avPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:recordingURL error:nil];
        avPlayer.delegate = self;
        avPlayer.volume=1.0;
//        avPlayer.currentTime = 1.323;
        [avPlayer play];
    }
    
}

// 録音が終わったら呼ばれるメソッド

- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag {
    /*
     NSURL *recordingURL = recorder.url;
     player = [[AVAudioPlayer alloc]initWithContentsOfURL:recordingURL error:nil];
     player.delegate = self;
     //    player.volume=1.0;
     [player play];
     */
}

//- (IBAction)resStop:(id)sender {
//    
//    [avRecorder stop];
//    
//}

- (IBAction)play:(id)sender {
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryAmbient error:nil];
    
    
    // 録音ファイルパス
    NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask,YES);
    NSString *documentDir = [filePaths objectAtIndex:0];
    
    NSString *prePath = [documentDir stringByAppendingPathComponent:@"rec"];
    NSString *path = [prePath stringByAppendingFormat:@"%d.caf",dataNumber];
    
    NSURL *recordingURL = [NSURL fileURLWithPath:path];
    
    avPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:recordingURL error:nil];
    avPlayer.delegate = self;
    avPlayer.volume=1.0;
    [avPlayer play];
}

-(IBAction)deleteRec:(id)sender{
    buttonCondition = 0;
    [btn setImage:[UIImage imageNamed:@"RecStartButton.png"] forState:UIControlStateNormal];
}


-(IBAction)choseData1:(id)sender{
    dataNumber = 1;
    label.text=[NSString stringWithFormat:@"%d",dataNumber];
}
-(IBAction)choseData2:(id)sender{
    dataNumber = 2;
    label.text=[NSString stringWithFormat:@"%d",dataNumber];
}
-(IBAction)choseData3:(id)sender{
    dataNumber = 3;
    label.text=[NSString stringWithFormat:@"%d",dataNumber];
}








@end
