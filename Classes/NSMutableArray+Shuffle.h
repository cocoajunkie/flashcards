//
//  NSMutableArray+Shuffle.h
//  Flashcards
//
//  Created by Paul Litvak on 2/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NSMutableArray (Shuffle)

// Fisher/Yates Shuffle (Knuth Shuffle)
// http://en.wikipedia.org/wiki/Fisher-Yates_shuffle
- (void) shuffle;

@end