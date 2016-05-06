//
//  Card.m
//  Card
//
//  Created by Leah Zulas on 1/30/16.
//  Copyright © 2016 Leah Zulas. All rights reserved.
//

#import "Card.h"

@interface Card()
@end

@implementation Card

-(int)match:(NSArray *)otherCards{
    int score = 0;
    
    for (Card * card in otherCards){
        if ([card.contents isEqualToString:self.contents]){
            score = 1;
        }
        
    }
    return score;
}

@end
