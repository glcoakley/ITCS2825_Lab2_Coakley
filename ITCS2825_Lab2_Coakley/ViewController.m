//
//  ViewController.m
//  ITCS2825_Lab2_Coakley
//
//  Created by Gary Coakley on 1/26/15.
//  Copyright (c) 2015 Gary Coakley. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

static const int ROCK = 0;
static const int PAPER = 1;
static const int SCISSORS = 2;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.computerImageView.hidden = TRUE;
    self.youImageView.hidden = TRUE;
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
    switch (self.you)
    {
        case ROCK:
        {
            if(self.computer == ROCK)
            {
                self.winnerLabel.text = @"It's a TIE!";
            }
            if(self.computer == PAPER)
            {
                self.winnerLabel.text = [NSString stringWithFormat:
                                         @"You Lose! %i to %i", self.youScore, ++self.computerScore];
            }
            if(self.computer == SCISSORS)
            {
                self.winnerLabel.text = [NSString stringWithFormat:
                                         @"You Win! %i to %i", ++self.youScore, self.computerScore];
            }
        }
            break;
            
        case PAPER:
        {
            if(self.computer == PAPER)
            {
                self.winnerLabel.text = @"It's a TIE!";
            }
            if(self.computer == SCISSORS)
            {
                self.winnerLabel.text = [NSString stringWithFormat:
                                         @"You Lose! %i to %i", self.youScore, ++self.computerScore];
            }
            if(self.computer == ROCK)
            {
                self.winnerLabel.text = [NSString stringWithFormat:
                                         @"You Win! %i to %i", ++self.youScore, self.computerScore];
            }
        }
            break;
            
        case SCISSORS:
        {
            if(self.computer == SCISSORS)
            {
                self.winnerLabel.text = @"It's a TIE!";
            }
            if(self.computer == ROCK)
            {
                self.winnerLabel.text = [NSString stringWithFormat:
                                         @"You Lose! %i to %i", self.youScore, ++self.computerScore];
            }
            if(self.computer == PAPER)
            {
                self.winnerLabel.text = [NSString stringWithFormat:
                                         @"You Win! %i to %i", ++self.youScore, self.computerScore];
            }
        }
            break;
            
    }
}

@end
