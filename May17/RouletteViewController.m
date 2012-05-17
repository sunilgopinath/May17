//
//  RouletteViewController.m
//  May17
//
//  Created by Sunil Gopinath on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RouletteViewController.h"
#import "RouletteView.h"
#import "HelpViewController.h"
#import "May17AppDelegate.h"

@interface RouletteViewController ()

@end

@implementation RouletteViewController
@synthesize text;
@synthesize winningNumber;

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/
- (id) initWithText: (NSString *) t
              title: (NSString *) title
              image: (UIImage *) image
              badge: (NSString *) badge {
    
	self = [super initWithNibName: nil bundle: nil];
	if (self != nil) {
		self.title = title;
		self.tabBarItem.image = image;
		self.tabBarItem.badgeValue = badge;
		self.text = t;		//text = [t copy];
        self.winningNumber = 0;
	}
	
	return self;
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void) loadView
{
	CGRect frame = [UIScreen mainScreen].applicationFrame;
	self.view = [[RouletteView alloc] initWithFrame: frame controller: self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) spinWheel:(id)sender spinLayer: (CALayer *)inLayer {
    NSInteger random = rand() % 1000;
    NSLog(@"random = %d", random);
    NSLog(@"random mod 360 = %d", random % 360);
    NSLog(@"winning number = %d", [self numberFromDegrees:random % 360]);
    [self spinLayer:inLayer duration:1 direction:SPIN_COUNTERCLOCK_WISE degrees:random];
    
}

- (void)spinLayer:(CALayer *)inLayer duration:(CFTimeInterval)inDuration
        direction:(int)direction degrees: (CGFloat)degrees
{
    
    rotationAnimation.timingFunction = 
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    
    // Perform the rotation over this many seconds
    rotationAnimation.duration = inDuration;
    
    // Rotate about the z axis
    rotationAnimation = 
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    // Rotate 360 degress, in direction specified
    rotationAnimation.toValue = [NSNumber numberWithFloat: DEGREES_TO_RADIANS(degrees) * direction];
    
    
    // Set the pacing of the animation
    rotationAnimation.fillMode = kCAFillModeForwards;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.cumulative = YES;
    rotationAnimation.additive = YES;
    // Add animation to the layer and make it so
    [inLayer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (int) numberFromDegrees: (int)degrees {
        NSLog(@"degrees = %d", degrees);
    int winner = 0;
    if(degrees >= 0 && degrees < 60) {
        winner = 1;
    } else if(degrees >= 60 && degrees < 120) {
        winner = 3;
    } else if(degrees >= 120 && degrees < 180) {
        winner = 5;
    } else if(degrees >= 180 && degrees < 240) {
        winner = 2;
    } else if(degrees >= 240 && degrees < 300) {
        winner = 4;
    } else {
        winner = 6;
    } 
    self.winningNumber = winner;
    return winner;
}

- (void) presentModalViewController {
    [self presentModalViewController:
     [[UINavigationController alloc] initWithRootViewController:
      [[HelpViewController alloc] initWithNibName: nil bundle: nil]
      ]
                            animated: YES
     ];
}

- (void) playCongratulations:(id)sender {
    UIApplication *application = [UIApplication sharedApplication];
	May17AppDelegate *applicationDelegate = application.delegate;
	[applicationDelegate playCongratulations:sender];
}

@end
