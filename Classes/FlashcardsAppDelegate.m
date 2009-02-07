//
//  FlashcardsAppDelegate.m
//  Flashcards
//
//  Created by Paul Litvak on 2/5/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "FlashcardsAppDelegate.h"
#import "FlashcardsViewController.h"
#import "Flashcard.h"
@implementation FlashcardsAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	modelFilePath = [[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"model"] retain];
	
	decks = [[NSKeyedUnarchiver unarchiveObjectWithFile:modelFilePath] retain];
    if (!decks) {		
		NSMutableDictionary* firstDeck = [NSMutableDictionary dictionary];
		[firstDeck setObject:[NSMutableArray array] forKey:@"cards"];
		[firstDeck setObject:@"my first deck" forKey:@"name"];
		decks = [[NSMutableArray alloc] initWithObjects:firstDeck, nil];
	}

	[window addSubview:viewController.view];	
	
	viewController.cards = [[decks objectAtIndex:0] objectForKey:@"cards"];
	if ([viewController.cards count] == 0)
		[viewController.cards addObject:[Flashcard cardWithTerm:@"term" definition:@"definition"]];
	[viewController displayCardAtIndex:0];
	
    [window makeKeyAndVisible];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	[self saveModel];
}

- (void)dealloc {
	[decks release];
	[modelFilePath release];
    [viewController release];
    [window release];
    [super dealloc];
}

- (void)saveModel; {
	[NSKeyedArchiver archiveRootObject:decks toFile:modelFilePath];
}

@end
