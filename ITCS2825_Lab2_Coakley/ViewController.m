//
//  ViewController.m
//  ITCS2825_Lab2_Coakley
//
//  Created by Gary Coakley on 1/26/15.
//  Copyright (c) 2015 Gary Coakley. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)HandleMenu:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblComputer;
@property (weak, nonatomic) IBOutlet UILabel *lblUser;
- (IBAction)activateDialogBox:(UIButton *)sender;
@end

static const int ROCK = 0;
static const int PAPER = 1;
static const int SCISSORS = 2;

static  int     lzrdSpokUserComputerResults[5][5] =
/*                                                  Computer's Picks                 */
{   /*                                  Rock    Paper   Scissors    Lizard      Spock    */
    /* The        */  /* Rock    */   {   00,     -1,     +1,         +1,         -1 },
    /* Human's    */  /* Paper   */   {   +1,     00,     -1,         -1,         +1 },
    /* Picks      */  /* Scissors*/   {   -1,     +1,     00,         +1,         -1 },
    /* on this    */  /* Lizard  */   {   -1,     +1,     -1,         00,         +1 },
    /*  axis      */  /* Spock   */   {   +1,     -1,     +1,         -1,         00 }
};


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self changeVisibility:false];
    [self resetGame];
    [self changeVisibility:true];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClickRock:(id)sender
{
    // set you to rock
    self.youImageView.image = [UIImage imageNamed:@"rock.jpg"];
    self.you = ROCK;
    
    // let the computer choose
    [self computerChoice];
    
    // check for the winner
    [self winner];
    
    // set the images to visible
    self.youImageView.hidden = FALSE;
    self.computerImageView.hidden = FALSE;
}

- (IBAction)onClickPaper:(id)sender
{
    // set you to rock
    self.youImageView.image = [UIImage imageNamed:@"paper.jpg"];
    self.you = PAPER;
    
    // let the computer choose
    [self computerChoice];
    
    // check for the winner
    [self winner];
    
    // set the images to visible
    self.youImageView.hidden = FALSE;
    self.computerImageView.hidden = FALSE;
}

- (IBAction)onClickScissors:(id)sender
{
    // set you to rock
    self.youImageView.image = [UIImage imageNamed:@"scissors.jpg"];
    self.you = SCISSORS;
    
    // let the computer choose
    [self computerChoice];
    
    // check for the winner
    [self winner];
    
    // set the images to visible
    self.youImageView.hidden = FALSE;
    self.computerImageView.hidden = FALSE;
}

-(void)computerChoice
{
    // generates a number between 0 and 2
    self.computer = arc4random() % 3;
    
    if(self.computer == ROCK)
    {
        self.computerImageView.image = [UIImage imageNamed:@"rock.jpg"];
    }
    if(self.computer == PAPER)
    {
        self.computerImageView.image = [UIImage imageNamed:@"paper.jpg"];
    }
    if(self.computer == SCISSORS)
    {
        self.computerImageView.image = [UIImage imageNamed:@"scissors.jpg"];
    }
}

-(void)winner
{
    int     gameResult = lzrdSpokUserComputerResults[self.you][self.computer];
    self.winnerLabel.hidden = false;
    switch ( gameResult )
    {
        case   -1:     // computer wins
        {
            self.winnerLabel.text = [NSString stringWithFormat:
                                     @"You Lose! %i to %i", self.youScore, ++self.computerScore];
            
        }
        break;
            
        case   0:     // it's a tie
        {
            self.winnerLabel.text = @"It's a TIE!";
        }
        break;
            
        case   +1:     // the user wins
        {
            self.winnerLabel.text = [NSString stringWithFormat:
                                     @"You Win! %i to %i", ++self.youScore, self.computerScore];
        }
        break;
    }
}

-(void)resetGame{
    [self changeVisibility:false];
    self.youImageView.image = [UIImage imageNamed:@"rock.jpg"];
    self.computerImageView.image = [UIImage imageNamed:@"rock.jpg"];
    self.youScore = 0;
    self.computerScore = 0;
    self.winnerLabel.hidden = true;
}


-(void)changeVisibility:(bool)aVisibleBool
{
    self.youImageView.hidden = !aVisibleBool;
    self.computerImageView.hidden = !aVisibleBool;
    self.lblUser.hidden = !aVisibleBool;
    self.lblComputer.hidden = !aVisibleBool;
}

- (IBAction)HandleMenu:(UIButton *)sender {
}
- (IBAction)activateDialogBox:(UIButton *)sender {
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc]
                   initWithTitle: @"Choices"
                   message:@"Please choose an action"
                   delegate: self
                   cancelButtonTitle: @"Cancel"
                   otherButtonTitles: @"User", @"Reset", @"Quit", nil];
    [alertDialog show];
}

// Receives the index of the button that was selected in the alert view
- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // get the title of the selected button
    NSString *buttonTitle=[alertView buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:@"Reset"])
    {
        [self changeVisibility:false];
        [self resetGame];
        [self changeVisibility:true];
    }
    else if ([buttonTitle isEqualToString:@"Quit"])
    {
        exit(0);
    }
    else if ([buttonTitle isEqualToString:@"User"])
    {
        UIAlertView *alertDialog;
        alertDialog = [[UIAlertView alloc]
                       initWithTitle: @"User Name"
                       message:@"Please enter your user name"
                       delegate: self
                       cancelButtonTitle: @"Ok"
                       otherButtonTitles: nil];
        alertDialog.alertViewStyle=UIAlertViewStylePlainTextInput;
        [alertDialog show];
    }
    else if ([alertView.title
         isEqualToString: @"User Name"])
    {
        NSString * txt = [[alertView textFieldAtIndex:0] text];
        if ( ([txt length]!= 0) && !isspace( [txt characterAtIndex:0]) )
        {
            // assign the text to the user name
            self.lblUser.text=[[alertView textFieldAtIndex:0] text];
        }
    }

}


@end