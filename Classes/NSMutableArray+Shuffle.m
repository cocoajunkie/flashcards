//
//  NSMutableArray+Shuffle.m
//  Flashcards
//
//  Created by Paul Litvak on 2/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NSMutableArray+Shuffle.h"

@implementation NSMutableArray (Shuffle)

// Fisher/Yates Shuffle (Knuth Shuffle)
// http://en.wikipedia.org/wiki/Fisher-Yates_shuffle
- (void) shuffle {
	for (NSInteger i = [self count] - 1; i > 0; --i) {
		NSInteger j = random() % i;
		[self exchangeObjectAtIndex:j withObjectAtIndex:i];
	}
}

@end