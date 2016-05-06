//
//  CardMatchingGame.m
//  Card
//
//  Created by Leah Zulas on 1/31/16.
//  Copyright © 2016 Leah Zulas. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of Card

@end

@implementation CardMatchingGame

-(NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck: (Deck *)deck{
    self = [super init]; //try to make me
    if (self) {
        if (count < 2)
        {
            self = nil;
        }else{
            
            for (int i = 0; i < count; i++){
                Card *card = [deck drawRandomCard];
                if (card){
                    [self.cards addObject:card];
                }else{
                    self = nil;
                    break;
                }
                
            }   
        }
    }
    return self;
    
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOSE = 1;

-(void) chooseCardAtIndex:(NSUInteger) index{
    
    Card *card = [self cardAtIndex:index];
    
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        }else{
            //match against other card
            for (Card *otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore){
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }

            }
            self.score -= COST_TO_CHOSE;
            card.chosen = YES;
        }
        
    }
    
    
}
-(Card *)cardAtIndex:(NSInteger) index{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

-(instancetype)init{
    return nil;
}


@end
