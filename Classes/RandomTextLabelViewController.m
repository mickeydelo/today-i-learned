//
//  RandomTextLabelViewController.m
//  TodayILearned
//
//  Created by Mickey DeLorenzo (hey_suburbia) on 02/05/2011.
//
//  RC 1 created 03/07/2011
//  Release 1.1 6/6/11

#import "RandomTextLabelViewController.h"
#import "ShareKit/Core/SHK.h"

@implementation RandomTextLabelViewController
@synthesize textLabel, randomStrings;


// Implement viewDidLoad to do additional setup after loading the view
- (void)viewDidLoad {
    [super viewDidLoad];
	self.randomStrings = [NSArray arrayWithObjects:
						  //April28th
						  @"That Leonard Nimoy was the voice of Galvatron in 'Transformers The Movie' from 1986\r\n(By: Brozilla)",
						  @"That after 20 years, comprehensive stabilization and restorative work, the tower of Pisa is now open again for people to walk around\r\n(By: staffell)",
						  @"That Australia has over a million feral camels\r\n(By: ForceOfMortality)",
						  @"That David Prowse, the actor who physically played Darth Vader, was given false lines during filming by Lucas and was never told his voice or lines wouldn't be used until he heard it during the first screening of the movie\r\n(By: BKCentral)",
						  @"There is a 5 dollar fine for anyone on staff at the Top Gun school who quotes the movie.",

						  nil];
						  }
						  
						  -(IBAction)showRandomString {
							  textLabel.text = [randomStrings objectAtIndex:arc4random() % [randomStrings count]];	
						  }


#define credditalert 1
#define sendalert 2
						  
						  -(IBAction)credditBtn: (id) sender{	
							  UIAlertView *alert = [[UIAlertView alloc]
													initWithTitle:@"Credits" 
													message:@"Compiled and developed by Mickey DeLorenzo (hey_suburbia), content editing by Brad DeLorenzo.\r\n\r\nMost content submitted by users of Reddit.com/r/TodayILearned"
													delegate:self 
													cancelButtonTitle:@"OK" 
													otherButtonTitles:@"Visit", nil];
							  alert.tag = credditalert;
							  [alert show];
							  [alert release];
						  }

-(IBAction)sendBtn: (id) sender2{	
	UIAlertView *alert = [[UIAlertView alloc]
						   initWithTitle:@"Send Me Your Feedback" 
						   message:@"Submit your own fun fact or something cool you learned today.  Also, send bugs, suggestions, corrections, or other concerns."
						   delegate:self 
						   cancelButtonTitle:@"Cancel" 
						   otherButtonTitles:@"Submit", nil];
	alert.tag = sendalert;
	[alert show];
	[alert release];
}

						  
						  - (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
						  // resign the shake FirstResponder, no keyboard if not
						  //[self resignFirstResponder];
						  // making the otherButtonTitles button in the alert open a URL
							  if (alertView.tag == credditalert){
							  if(buttonIndex==1)
								  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://reddit.com/r/todayilearned"]];
							      }
							   else if (alertView.tag == sendalert){
                              if(buttonIndex==1)
	                               [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.basicfunction.com/til/contact/"]];
                              }
						  }

						  
						  -(IBAction)shareBtn {
							  // resign the shake FirstResponder, no keyboard if not
							  [self resignFirstResponder];
							  
							  // Grab the current random text on screen
							  NSString *tilText = textLabel.text;
							  NSString *preText = [NSString stringWithFormat:@"Today I Learned... %@", tilText];
							  
							  SHKItem *item = [SHKItem text:preText];
							  
							  // Get the ShareKit action sheet
							  SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
							  
							  // Display the action sheet
							  [actionSheet showInView:[self view]];
						  }
						  
						  //Shake
						  -(BOOL)canBecomeFirstResponder{
							  return YES;
						  }
						  
						  -(void)viewDidAppear:(BOOL)animated{
							  [super viewDidAppear:animated];
							  [self becomeFirstResponder];
						  }
						  
						  -(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
						  {
							  if (event.subtype == UIEventSubtypeMotionShake)
							  {
								  textLabel.text = [randomStrings objectAtIndex:arc4random() % [randomStrings count]];
							  }
						  }
						  
						  - (void)viewDidUnload {
							  // Release any retained subviews of the main view.
							  // e.g. self.myOutlet = nil;
							  self.textLabel = nil;
						  }
						  
						  - (void)dealloc {
							  [self.textLabel release];
							  [self.randomStrings release];
							  [super dealloc];
						  }
						  
						  @end
