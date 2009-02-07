//
//  Flashcard.h
//  Flashcards
//
//  Created by Paul Litvak on 2/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Flashcard : NSObject <NSCoding> {
	NSString* term;
	NSString* definition;
}
@property (copy) NSString* term;
@property (copy) NSString* definition;

+ (id)cardWithTerm:(NSString*)aTerm definition:(NSString*)aDefinition;
- (id)initWithTerm:(NSString*)aTerm definition:(NSString*)aDefinition;

- (id)initWithCoder:(NSCoder *)decoder;
- (void)encodeWithCoder:(NSCoder *)encoder;
@end
