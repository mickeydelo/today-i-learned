//
//  RandomTextLabelAppDelegate.h
//  TodayILearned
//
//  Created by Mickey DeLorenzo (hey_suburbia) on 02/05/2011.
//

#import <UIKit/UIKit.h>

@class RandomTextLabelViewController;

@interface RandomTextLabelAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    RandomTextLabelViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RandomTextLabelViewController *viewController;

@end

