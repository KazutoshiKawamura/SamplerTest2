//
//  RecViewController.h
//  SamplerTest2
//
//  Created by kztskawamu on 2015/02/25.
//  Copyright (c) 2015年 kztskawamu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface RecViewController : UIViewController <UITextFieldDelegate,AVAudioRecorderDelegate,AVAudioPlayerDelegate>{
    
    AVAudioRecorder *avRecorder;
    AVAudioPlayer *avPlayer[50];
    int dataNumber;
    IBOutlet UILabel *label;
    int buttonCondition;
    IBOutlet UIButton *btn;
    int playCount;
    IBOutlet UITextField *naming;
    NSString *name;
    
    
}
@property int secondNum;
//@property IBOutlet UIButton *btn;
- (IBAction)recStartAndStop:(id)sender;
//- (IBAction)resStop:(id)sender;
//- (IBAction)play:(id)sender;
-(IBAction)deleteRec:(id)sender;
-(IBAction)done:(id)sender;
-(BOOL)textFieldShouldReturn:(UITextField *)naming;
-(IBAction)choseData1:(id)sender;
-(IBAction)choseData2:(id)sender;
-(IBAction)choseData3:(id)sender;

@end
