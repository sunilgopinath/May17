//
//  HelpViewController.m
//  May17
//
//  Created by Sunil Gopinath on 5/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.rightBarButtonItem =
        [[UIBarButtonItem alloc] initWithTitle: @"Done"
                                         style: UIBarButtonItemStyleDone
                                        target: self
                                        action: @selector(dismissModalViewController)];
    }
    return self;
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void) loadView
{
	NSURL *url = [NSURL URLWithString: @"http://en.wikipedia.org/wiki/Big_Six_wheel"];
	NSData *data = [NSData dataWithContentsOfURL: url];
	if (data == nil) {
		NSLog(@"could not load URL %@", url);
		return;
	}
    
	//No reason to create the UIWebView if we couldn't create the NSData.
	UIWebView *webView =
    [[UIWebView alloc] initWithFrame: [UIScreen mainScreen].applicationFrame];
    [webView  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@
                                                        "http://en.wikipedia.org/wiki/Big_Six_wheel"]]];
	self.view = webView;
}

- (void) dismissModalViewController {
	//Before iOS 5, we said parentViewController instead of presentingViewController.
	[self.presentingViewController dismissModalViewControllerAnimated: YES];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
    
	//Fade in the green band.
	[UIView animateWithDuration: 2
                          delay: 1
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations: ^{
                         self.view.alpha = 1;
                     }
                     completion: NULL
     ];
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

@end
