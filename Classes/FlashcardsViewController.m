//
//  FlashcardsViewController.m
//  Flashcards
//
//  Created by Paul Litvak on 2/5/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "FlashcardsViewController.h"
#import "Flashcard.h"
#import "FlashcardsAppDelegate.h"
#import "NSMutableArray+Shuffle.h"

@implementation FlashcardsViewController

@synthesize cards;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {

    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self view].multipleTouchEnabled = YES;
	textField.enabled = NO;
	textField.font = [UIFont fontWithName:@"Arial" size:36];		
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)dealloc {
	[displayedFace release];
	[displayedCard release];
	[cards release];
	[super dealloc];
}

- (void)displayCardAtIndex:(int)index; {
	displayedCardIndex = index;
	cardNumberLabel.text = [NSString stringWithFormat:@"%d / %d", displayedCardIndex + 1, [cards count]];
	[self displayFace:@"term" ofCard:[cards objectAtIndex:displayedCardIndex]];
}

- (void)displayFace:(NSString*)face ofCard:(Flashcard*)card {
	if (textField.enabled)
		[displayedCard setValue:textField.text forKey:displayedFace];

	if (card != displayedCard) {
		[displayedCard release];
		displayedCard = [card retain];
	}
	if (face != displayedFace) {
		[displayedFace release];
		displayedFace = [face copy];
	}
	
	textField.text = [displayedCard valueForKey:displayedFace];
}

- (IBAction)displayNextCard:(id)sender; {
	if (displayedCardIndex != [cards count] - 1)
		[self displayCardAtIndex:displayedCardIndex + 1];
}

- (IBAction)displayPreviousCard:(id)sender; {
	if (displayedCardIndex != 0)
		[self displayCardAtIndex:displayedCardIndex - 1];	
}

- (IBAction)editCard:(id)sender; {
	textField.enabled = YES;
	[textField becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)aTextField {
	[textField resignFirstResponder];
	textField.enabled = NO;
	[displayedCard setValue:textField.text forKey:displayedFace];
	[[[UIApplication sharedApplication] delegate] saveModel];
	return YES;
}

- (IBAction)deleteCard:(id)sender; {
	if ([cards count] > 1) {
		[cards removeObjectAtIndex:displayedCardIndex];
		[[[UIApplication sharedApplication] delegate] saveModel];
		[self displayCardAtIndex:(displayedCardIndex == [cards count]) ? displayedCardIndex - 1 : displayedCardIndex];
	}
}

- (IBAction)shuffleCards:(id)sender; {
	[cards shuffle];
	[self displayCardAtIndex:0];
}

- (IBAction)addNewCard:(id)sender; {
	[cards addObject:[Flashcard cardWithTerm:@"" definition:@""]];
	[self displayCardAtIndex:[cards count] - 1];
	[self editCard:self];
}

- (IBAction)flipCard:(id)sender; {
	[self displayFace:(([displayedFace isEqualTo:@"term"]) ? @"definition" : @"term") ofCard:displayedCard];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch* touch = [touches anyObject];
	if (touch.view == [self view]) {
		if (touch.tapCount == 1)
			[self flipCard:self];
	}
}

@end
