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
		self.backgroundColor = [UIColor whiteColor];
		self.textAlignment = UITextAlignmentCenter;
		self.text = @"ModalView";
		self.userInteractionEnabled = YES;
		modalViewController = c;
        CGRect f = CGRectMake(0, self.bounds.size.height - 350, self.bounds.size.width, 253);
        UIImageView* jamesView = [[UIImageView alloc] initWithFrame:f];
        
        NSMutableArray *images = [[NSMutableArray alloc] init];
        for(int i = 1; i < 30; i++) {
            NSString *name = [NSString stringWithFormat:@"james%d.gif", i];
            [images addObject:[UIImage imageNamed:name]];
        }
        jamesView.animationImages = images;

        // all frames will execute in 1.75 seconds
        jamesView.animationDuration = 1.50;
        // repeat the annimation forever
        jamesView.animationRepeatCount = 0;
        // start animating
        [jamesView startAnimating];
        // add the animation view to the main window 
        [self addSubview:jamesView];
        
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
