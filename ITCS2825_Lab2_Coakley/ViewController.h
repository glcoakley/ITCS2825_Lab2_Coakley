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

-(void)computerChoice;
-(void)winner;


@property int you;
@property int computer;
@property int youScore;
@property int computerScore;

@end

