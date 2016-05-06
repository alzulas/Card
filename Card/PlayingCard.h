//
//  PlayingCard.h
//  Card
//
//  Created by Leah Zulas on 1/30/16.
//  Copyright © 2016 Leah Zulas. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
