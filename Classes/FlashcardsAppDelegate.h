//
//  FlashcardsAppDelegate.h
//  Flashcards
//
//  Created by Paul Litvak on 2/5/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlashcardsViewController;

@interface FlashcardsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FlashcardsViewController *viewController;
	NSString* modelFilePath;
	NSMutableArray* decks;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FlashcardsViewController *viewController;

- (void)saveModel;

@end

