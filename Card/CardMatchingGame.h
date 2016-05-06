//
//  CardMatchingGame.h
//  Card
//
//  Created by Leah Zulas on 1/31/16.
//  Copyright © 2016 Leah Zulas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck: (Deck *)deck;

-(void) chooseCardAtIndex:(NSUInteger) index;
-(Card *)cardAtIndex:(NSInteger) index;

@property (nonatomic, readonly) NSInteger score; //publicly read only

@end
