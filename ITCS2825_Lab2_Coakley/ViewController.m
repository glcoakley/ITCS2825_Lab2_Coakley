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
@property (weak, nonatomic) IBOutlet UIButton *btnLZSpock;
- (IBAction)actLZSpock:(UIButton *)sender;
@end

static  const    int LevelTwoLimit = 5;


enum{
    ROCK,
    PAPER,
    SCISSORS,
    LIZARD,
    SPOCK
};



static  int     lzrdSpokUserComputerResults[5][5] =
/*                                                  Computer's Picks                 */
{   /*                                  Rock    Paper   Scissors    Lizard      Spock    */
    /* The        */  /* Rock    */   {   00,     -1,     +1,         +1,         -1 },
    /* Human's    */  /* Paper   */   {   +1,     00,     -1,         -1,         +1 },
    /* Picks      */  /* Scissors*/   {   -1,     +1,     00,         +1,         -1 },
    /* on this    */  /* Lizard  */   {   -1,     +1,     -1,         00,         +1 },
    /*  axis      */  /* Spock   */   {   +1,     -1,     +1,         -1,         00 }
};

//static CGRect btFrame;

@implementation ViewController

-(void) viewDidAppear:(BOOL)animated {
    
    self.isLZSpockRunning = false;
    self.btnLizard.hidden = true;
    self.btnLizard.enabled = false;
    self.btnSpock.hidden = true;
    self.btnSpock.enabled = false;
    
    CGRect btFrame = self.btnScissors.frame;
    btFrame.origin.x = 245;
    btFrame.origin.y = 430;
    self.btnScissors.autoresizingMask = UIViewAutoresizingNone;
    self.btnScissors.frame = btFrame;
    
    btFrame = self.btnPaper.frame;
    btFrame.origin.x = 130;
    btFrame.origin.y = 430;
    self.btnPaper.autoresizingMask = UIViewAutoresizingNone;
    self.btnPaper.frame = btFrame;
    
}

-(void) setupAllLZSpockIF {

    self.btnLZSpock.enabled = true;
    CGRect btFrame = self.btnPaper.frame;
    btFrame.origin.x = 66;
    btFrame.origin.y = 430;
    self.btnPaper.autoresizingMask = UIViewAutoresizingNone;
    self.btnPaper.frame = btFrame;
    
    btFrame = self.btnScissors.frame;
    btFrame.origin.x = 122;
    btFrame.origin.y = 430;
    self.btnScissors.autoresizingMask = UIViewAutoresizingNone;
    self.btnScissors.frame = btFrame;
    
    self.btnLizard.hidden = false;
    self.btnLizard.enabled = true;
    self.btnSpock.hidden = false;
    self.btnSpock.enabled = true;
    
    [self resetGame];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self changeVisibility:false];
    [self resetGame];
    [self changeVisibility:true];
    self.btnLZSpock.enabled = false;
    [[self btnLZSpock] setTitleColor:[[UIColor redColor] colorWithAlphaComponent:.23] forState:UIControlStateDisabled];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) processUserChoice: (int)aChoice : (UIImage *)aWithImage{
    
    self.youImageView.image = aWithImage;
    self.you = aChoice;
    
    // let the computer choose
    [self computerChoice];
    
    // check for the winner
    [self winner];
    
    // set the images to visible
    self.youImageView.hidden = FALSE;
    self.computerImageView.hidden = FALSE;
    
    
}

- (IBAction)onClickRock:(id)sender
{
    [self processUserChoice:ROCK : [UIImage imageNamed:@"rock.jpg"]];
}

- (IBAction)onClickPaper:(id)sender
{
    [self processUserChoice:PAPER : [UIImage imageNamed:@"paper.jpg"]];
}

- (IBAction)onClickScissors:(id)sender
{
    [self processUserChoice:SCISSORS : [UIImage imageNamed:@"scissors.jpg"]];
}

- (IBAction)onClickLizard:(UIButton *)sender {
    [self processUserChoice:LIZARD : [UIImage imageNamed:@"lizard.jpg"]];
}

- (IBAction)onClickSpock:(UIButton *)sender {
    [self processUserChoice:SPOCK : [UIImage imageNamed:@"spock.jpg"]];
}


-(void)computerChoice
{
    // generates a number between 0 and 2
    self.computer = arc4random() % 5;
    
    if(self.computer == ROCK)
    {
        self.computerImageView.image = [UIImage imageNamed:@"rock.jpg"];
    }
    else if(self.computer == PAPER)
    {
        self.computerImageView.image = [UIImage imageNamed:@"paper.jpg"];
    }
    else if(self.computer == SCISSORS)
    {
        self.computerImageView.image = [UIImage imageNamed:@"scissors.jpg"];
    }
    else if(self.computer == LIZARD)
    {
        self.computerImageView.image = [UIImage imageNamed:@"lizard.jpg"];
    }
    else if(self.computer == SPOCK)
    {
        self.computerImageView.image = [UIImage imageNamed:@"spock.jpg"];
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
    if ( !self.isLZSpockRunning )
    {
        if ( self.youScore >= LevelTwoLimit )
        {
            [self setupAllLZSpockIF];
            self.isLZSpockRunning = true;
        }
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


- (IBAction)actLZSpock:(UIButton *)sender {
}
@end