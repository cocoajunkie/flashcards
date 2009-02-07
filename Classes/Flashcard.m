//
//  Flashcard.m
//  Flashcards
//
//  Created by Paul Litvak on 2/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Flashcard.h"


@implementation Flashcard
@synthesize term;
@synthesize definition;

+ (id)cardWithTerm:(NSString*)aTerm definition:(NSString*)aDefinition; {
	return [[[Flashcard alloc] initWithTerm:aTerm definition:aDefinition] autorelease];
}

- (id)initWithTerm:(NSString*)aTerm definition:(NSString*)aDefinition; {
	if (self = [super init]) {
		[self setTerm:aTerm];
		[self setDefinition:aDefinition];		
	}	
	return self;
}

- (id)initWithCoder:(NSCoder *)coder; {
	[self setTerm:[coder decodeObjectForKey:@"term"]];
	[self setDefinition:[coder decodeObjectForKey:@"definition"]];		
	return self;
}

- (void)encodeWithCoder:(NSCoder *)coder; {
	[coder encodeObject:term forKey:@"term"];
	[coder encodeObject:definition forKey:@"definition"];
}

- (void)dealloc {
	[term release];
	[definition release];
    [super dealloc];
}

@end
