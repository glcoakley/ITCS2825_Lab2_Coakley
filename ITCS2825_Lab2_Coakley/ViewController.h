//
//  ViewController.h
//  ITCS2825_Lab2_Coakley
//
//  Created by Gary Coakley on 1/26/15.
//  Copyright (c) 2015 Gary Coakley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate, UIActionSheetDelegate>



@property (weak, nonatomic) IBOutlet UIImageView *computerImageView;
@property (weak, nonatomic) IBOutlet UIImageView *youImageView;
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;

- (IBAction)onClickRock:(UIButton *)sender;
- (IBAction)onClickPaper:(UIButton *)sender;
- (IBAction)onClickScissors:(UIButton *)sender;
- (IBAction)onClickLizard:(UIButton *)sender;
- (IBAction)onClickSpock:(UIButton *)sender;

-(void)computerChoice;
-(void)winner;

@property (weak, nonatomic) IBOutlet UIButton *btnRock;
@property (weak, nonatomic) IBOutlet UIButton *btnPaper;
@property (weak, nonatomic) IBOutlet UIButton *btnScissors;
@property (weak, nonatomic) IBOutlet UIButton *btnLizard;
@property (weak, nonatomic) IBOutlet UIButton *btnSpock;

@property int you;
@property int computer;
@property int youScore;
@property int computerScore;

@property BOOL  isLZSpockRunning;


@end

