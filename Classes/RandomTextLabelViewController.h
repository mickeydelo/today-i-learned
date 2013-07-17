//
//  RandomTextLabelViewController.h
//  TodayILearned
//
//  Created by Mickey DeLorenzo (hey_suburbia) on 02/05/2011.
//

#import <UIKit/UIKit.h>
#import <Socialize/Socialize.h> 
@interface RandomTextLabelViewController : UIViewController {
	UILabel *textLabel;
	NSArray *randomStrings;
}

@property (nonatomic, retain) IBOutlet UILabel *textLabel;
@property (nonatomic, retain) NSArray *randomStrings;
-(IBAction)showRandomString;
-(IBAction)credditBtn:(id)sender; 
-(IBAction)sendBtn:(id)sender2;
-(IBAction)shareBtn;
@end