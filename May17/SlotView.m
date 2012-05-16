//
//  SlotView.m
//  May17
//
//  Created by Sunil Gopinath on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SlotView.h"
#import "SlotViewController.h"

@implementation SlotView

/*
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
*/

- (id) initWithFrame: (CGRect) frame controller: (SlotViewController *) c {
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"spinbackground.jpg"]];
		self.editable = NO;	//Don't pop up a keyboard.
		self.font = [UIFont fontWithName: @"Courier" size: 14]; //monospace
		viewController = c;
        
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *buttonImage = [UIImage imageNamed:@"spin.png"];
        [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
        
        //we know that the picker has bounds 320 x 216 so we need to position the button
        //under that space in center.
		CGRect b = self.bounds;
		CGSize s = CGSizeMake(200, 40);	//size of button
        CGFloat difference  = (b.size.height - s.height - 216)/2;
        
		button.frame = CGRectMake(
                                  b.origin.x + (b.size.width - 90) / 2,
                                  216 + 50,
                                  88,
                                  90
                                  );
        
		[button setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
		//[button setTitle: @"Play" forState: UIControlStateNormal];
        
		[button addTarget:self
                   action: @selector(touchUpInside:)
         forControlEvents: UIControlEventTouchUpInside
         ];
        
		[self addSubview: button];
        
        playAgainbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *playAgainButtonImage = [UIImage imageNamed:@"playagain.gif"];
        [playAgainbutton setBackgroundImage:playAgainButtonImage forState:UIControlStateNormal];
        
        //we know that the picker has bounds 320 x 216 so we need to position the button
        //under that space in center.

        
		playAgainbutton.frame = CGRectMake(
                                  b.origin.x + (b.size.width - 90) / 2,
                                  216 + 50,
                                  90,
                                  91
                                  );
        
		[playAgainbutton setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
		//[button setTitle: @"Play" forState: UIControlStateNormal];
        
		[playAgainbutton addTarget:self
                   action: @selector(touchUpInside:)
         forControlEvents: UIControlEventTouchUpInside
         ];
        
        //winners label
        UIFont *font = [UIFont systemFontOfSize: 16];
		//Put upper left corner of label in upper left corner of View.
		//Make label just big enough to hold the string.
		CGRect f = CGRectMake(
                       b.origin.x + (b.size.width - s.width) / 2,
                       216 + difference + s.height,
                       s.width,
                       s.height
                       );
        
		label = [[UILabel alloc] initWithFrame: f];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
		label.font = font;
        
		[self addSubview: label];
        
	}
	return self;
}

- (void) touchUpInside: (id) sender {
	//The sender is the button that was pressed.
    label.text = @"";
    [button removeFromSuperview];
	NSLog(@"The button was pressed.");
    BOOL win = NO;
    int numInRow = 1;
    int lastVal = -1;
    for(int i = 0; i<5 ;i++)
    {
        int newValue = random() % [viewController.column1 count];
        if(newValue == lastVal)
            numInRow++;
        else
            numInRow =1;
        lastVal = newValue;
        [viewController.picker selectRow:newValue inComponent:i animated:YES];
        [viewController.picker reloadComponent:i];
        if(numInRow >= 3)
            win = YES;
    }
    [self addSubview: playAgainbutton];
    if(win) {

        label.text = @"WIN!";
        
    }else {

        label.text = @"";
        
    }

    
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
/*
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
*/
@end
