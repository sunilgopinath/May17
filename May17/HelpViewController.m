//
//  HelpViewController.m
//  May17
//
//  Created by Sunil Gopinath on 5/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HelpViewController.h"
#import "HelpView.h"

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
	CGRect frame = [UIScreen mainScreen].applicationFrame;
	self.view = [[HelpView alloc] initWithFrame: frame controller: self];
}

- (void) dismissModalViewController {
	//Before iOS 5, we said parentViewController instead of presentingViewController.
	[self.presentingViewController dismissModalViewControllerAnimated: YES];
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

@end
