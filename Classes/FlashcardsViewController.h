//
//  FlashcardsViewController.h
//  Flashcards
//
//  Created by Paul Litvak on 2/5/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Flashcard;

@interface FlashcardsViewController : UIViewController {
	NSMutableArray* cards;
	int displayedCardIndex;
	Flashcard* displayedCard;
	NSString* displayedFace;
	
	IBOutlet UITextField* textField;
	IBOutlet UILabel* cardNumberLabel;
}

@property (retain) NSMutableArray* cards;

- (void)displayCardAtIndex:(int)index;
- (void)displayFace:(NSString*)face ofCard:(Flashcard*)card;

- (IBAction)editCard:(id)sender;
- (IBAction)deleteCard:(id)sender;
- (IBAction)shuffleCards:(id)sender;
- (IBAction)addNewCard:(id)sender;
- (IBAction)flipCard:(id)sender;
- (IBAction)displayNextCard:(id)sender;
- (IBAction)displayPreviousCard:(id)sender;

@end

