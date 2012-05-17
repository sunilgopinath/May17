//
//  RouletteViewController.h
//  May17
//
//  Created by Sunil Gopinath on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)
#define SPIN_CLOCK_WISE 1
#define SPIN_COUNTERCLOCK_WISE -1

@interface RouletteViewController : UIViewController {
	NSString *text;
    CABasicAnimation* rotationAnimation;
    NSInteger winningNumber;
}

- (id) initWithText: (NSString *) t
              title: (NSString *) title
              image: (UIImage *) image
              badge: (NSString *) badge;

- (void) spinWheel:(id)sender spinLayer: (CALayer *)inLayer;
- (void)spinLayer:(CALayer *)inLayer duration:(CFTimeInterval)inDuration
        direction:(int)direction degrees: (CGFloat)degrees;
- (void) presentModalViewController;

@property (nonatomic, copy) IBOutlet NSString *text;
@property (nonatomic) NSInteger winningNumber;

@end
