//
//  ViewController.m
//  Card
//
//  Created by Leah Zulas on 1/30/16.
//  Copyright © 2016 Leah Zulas. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()

@property (nonatomic, strong) Deck *myDeck;
@property (nonatomic, strong) CardMatchingGame *game;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController


-(CardMatchingGame *) game
{
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}


- (IBAction)touchCardButton:(UIButton *)sender {
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

-(void)updateUI{
    for (UIButton *cardButton in self.cardButtons){
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score = %ld", self.game.score];
}
-(NSString *)titleForCard:(Card *) card{
    return card.isChosen ? card.contents : @"";
}
-(UIImage *)backgroundImageForCard:(Card *) card{
    return [UIImage imageNamed: card.isChosen ? @"blankPlayingCard" : @"cardBack"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end