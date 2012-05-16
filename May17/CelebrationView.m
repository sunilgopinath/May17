//
//  CelebrationView.m
//  May17
//
//  Created by Sunil Gopinath on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CelebrationView.h"
#import "CelebrationViewController.h"

@implementation CelebrationView

- (id) initWithFrame: (CGRect) frame controller: (CelebrationViewController *) c {
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor orangeColor];
		self.textAlignment = UITextAlignmentCenter;
		self.text = @"ModalView";
		self.userInteractionEnabled = YES;
		modalViewController = c;
	}
	return self;
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	[modalViewController dismissModalViewController];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
