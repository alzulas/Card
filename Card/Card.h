//
//  Card.h
//  Card
//
//  Created by Leah Zulas on 1/30/16.
//  Copyright © 2016 Leah Zulas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

-(int) match:(NSArray *) otherCards;

@end
