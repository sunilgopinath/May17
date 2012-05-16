//
//  RouletteView.m
//  May17
//
//  Created by Sunil Gopinath on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RouletteView.h"
#import "RouletteViewController.h"

@implementation RouletteView

/*
 - (id) initWithFrame: (CGRect) frame
 {
 self = [super initWithFrame: frame];
 if (self) {
 // Initialization code
 }
 return self;
 }
 */

- (id) initWithFrame: (CGRect) frame controller: (RouletteViewController *) c {
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code

		self.backgroundColor = [UIColor whiteColor];
		self.editable = NO;	//Don't pop up a keyboard.
		self.font = [UIFont fontWithName: @"Courier" size: 14]; //monospace
		viewController = c;
	}
	return self;
}

- (void) drawRect: (CGRect) rect
{
	// Drawing code
	self.text = [viewController.text stringByAppendingString: @"\n"];
    
	for (UIView *v = self; v != nil; v = v.superview) {
		self.text = [self.text stringByAppendingFormat:
                     @"%@\n"
                     @"frame  (%g, %2g), %g × %g\n"
                     @"bounds (%g, %2g), %g × %g\n",
                     NSStringFromClass(v.class),
                     v.frame.origin.x,  v.frame.origin.y,  v.frame.size.width,  v.frame.size.height,
                     v.bounds.origin.x, v.bounds.origin.y, v.bounds.size.width, v.bounds.size.height
                     ];
	}
    
	CGAffineTransform ctm = CGContextGetCTM(UIGraphicsGetCurrentContext());
    
	self.text = [self.text stringByAppendingFormat:
                 @"\nCTM %5g%5g%5g\n"
                 @"    %5g%5g%5g\n"
                 @"    %5g%5g%5g",
                 ctm.a,  ctm.b,  0.0,
                 ctm.c,  ctm.d,  0.0,
                 ctm.tx, ctm.ty, 1.0
                 ];
}

- (void) spinWheel:(id)sender {
    
    CATransform3D rotationTransform = CATransform3DMakeRotation(1.0f * M_PI, 0, 0, 1.0);
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    rotationAnimation.toValue = [NSValue valueWithCATransform3D:rotationTransform];
    rotationAnimation.duration = 0.25f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 10; 
    
    [rotatingImage.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
}

@end
