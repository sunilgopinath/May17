//
//  RouletteView.m
//  May17
//
//  Created by Sunil Gopinath on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RouletteView.h"
#import "RouletteViewController.h"
#import "NumberSelectorView.h"

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
		self.autoresizingMask = UIViewAutoresizingFlexibleHeight;
		viewController = c;
        
        // CREATE BIG WHEEL
        UIImage *wheel = [UIImage imageNamed:@"wheelspinner.jpg"];
        NSLog(@"image.size = %f", wheel.size.width);
        rouletteWheel = [[UIImageView alloc] initWithImage:wheel];
        CGRect b = self.bounds;
		CGSize s = wheel.size;
        
		rouletteWheel.frame = CGRectMake(
                                  b.origin.x + (b.size.width - s.width) / 2,
                                  b.origin.y + (b.size.height - s.height) / 2 - 30,
                                  s.width,
                                  s.height
                                  );
        
        //CREATE POINTER
        UIImage *triangle = [UIImage imageNamed:@"triangle.png"];
        NSLog(@"image.size = %f", triangle.size.width);
        triangleView = [[UIImageView alloc] initWithImage:triangle];
        s = triangle.size;
		triangleView.frame = CGRectMake(
                                         b.origin.x + (b.size.width - s.width) / 2,
                                         b.origin.y + (b.size.height - s.height) / 2 - 160,
                                         s.width,
                                         s.height
                                         );
        // CREATE ROTATE BUTTON
		spin = [UIButton buttonWithType: UIButtonTypeRoundedRect];
		s = CGSizeMake(200, 40);	//size of button
		spin.frame = CGRectMake(
                                  b.origin.x,
                                  b.origin.y,
                                  s.width,
                                  s.height
                                  );
        
		[spin setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
		[spin setTitle: @"Rotate" forState: UIControlStateNormal];
        
		[spin addTarget: self
                   action: @selector(spinWheel:)
         forControlEvents: UIControlEventTouchUpInside
         ];
        
        // CREATE PLAY AGAIN BUTTON
        playAgain = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *playAgainImageDown = [UIImage imageNamed:@"02.png"];
        UIImage *playAgainImageUp = [UIImage imageNamed:@"01.png"];
        [playAgain setBackgroundImage:playAgainImageUp forState:UIControlStateNormal];
        [playAgain setBackgroundImage:playAgainImageDown forState:UIControlEventTouchDown];
        
        //we know that the picker has bounds 320 x 216 so we need to position the button
        //under that space in center.
        
        
		playAgain.frame = CGRectMake(b.size.width - playAgainImageDown.size.width - 10, 
                                     b.size.height - playAgainImageDown.size.height - 110,
                                     playAgainImageDown.size.width,
                                     playAgainImageDown.size.height
                                     );
        
		[playAgain setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
		//[button setTitle: @"Play" forState: UIControlStateNormal];
        
		[playAgain addTarget:self
                            action: @selector(spinWheel:)
                  forControlEvents: UIControlEventTouchUpInside
         ];
        
        // CREATE WINNING NUMBER LABEL
        text = [NSString stringWithFormat: @"The winning number is %d!", viewController.winningNumber];
		UIFont *font = [UIFont systemFontOfSize: 16];
		s = [text sizeWithFont: font];
		CGRect f = CGRectMake(
                              b.origin.x + (b.size.width - s.width) / 2,
                              self.bounds.origin.y + 360,
                              s.width,
                              s.height
                              );
        
		label = [[UILabel alloc] initWithFrame: f];
		label.backgroundColor = [UIColor clearColor];
		label.font = font;

        
        //CREATE NUMBER OPTIONS
        NSString *title = @"";
        font = [UIFont systemFontOfSize: 16];
        s = [title sizeWithFont: font];
        CGFloat width = 53;
        CGFloat height = 60;
        CGFloat yPosition = self.bounds.origin.y + 360;
        UIColor *color;
        NSLog(@"width = %f", b.size.width);
        

        NSArray *viewColors = [NSArray arrayWithObjects:
                               [UIColor redColor],                                                    
                               [UIColor orangeColor],                             
                               [UIColor yellowColor],
                               [UIColor greenColor],
                               [UIColor blueColor],                               
                               [UIColor purpleColor],
                               nil
                               ];

        NSLog(@"view colors = %d", viewColors.count);
        /*
        for(int i = 0; i < 2; i++) {
            title = [NSString stringWithFormat:@"%d", i];
            NSLog(@"title = %@", title);
            frame = CGRectMake(
                               i*width,
                               yPosition,
                               width,
                               height);
            UIColor *color = [viewColors objectAtIndex:i];
            NSLog(@"color = %f", color);
            UIView *view = [views objectAtIndex:i];
            view = [[NumberSelectorView alloc] initWithFrame:frame                                                              
                                                         col:color 
                                                        text:title                                                         
                                                           w:width 
                                                           h:height];

        }
         */
        
        //ONE: RED
        title = @"1";
		frame = CGRectMake(
                           0,
                           yPosition,
                           width,
                           height);
        color = [UIColor redColor];
        		redView = [[NumberSelectorView alloc] initWithFrame:frame 
                                                                col:color 
                                                               text:title 
                                                                  w:width 
                                                                  h:height];
        
        //TWO: ORANGE
        title = @"3";
		frame = CGRectMake(
                           width,
                           yPosition,
                           width,
                           height);
        
        color = [UIColor orangeColor];
        orangeView = [[NumberSelectorView alloc] initWithFrame:frame 
                                                           col:color 
                                                          text:title 
                                                             w:width 
                                                             h:height];
        
        //FIVE: YELLOW
        title = @"5";
		frame = CGRectMake(
                           2*width,
                           yPosition,
                           width,
                           height);
        
        color = [UIColor yellowColor];
        yellowView = [[NumberSelectorView alloc] initWithFrame:frame 
                                                           col:color 
                                                          text:title 
                                                             w:width 
                                                             h:height];
        //TWO: GREEN
        title = @"2";
		frame = CGRectMake(
                           3*width,
                           yPosition,
                           width,
                           height);
        
        color = [UIColor greenColor];
        greenView = [[NumberSelectorView alloc] initWithFrame:frame 
                                                          col:color 
                                                         text:title 
                                                            w:width 
                                                            h:height];
        
        //FOUR: BLUE
        title = @"4";
		frame = CGRectMake(
                           4*width,
                           yPosition,
                           width,
                           height);
        
        color = [UIColor blueColor];
        blueView = [[NumberSelectorView alloc] initWithFrame:frame 
                                                         col:color 
                                                        text:title 
                                                           w:width 
                                                           h:height];

        //SIX: PURPLE
        title = @"6";
		frame = CGRectMake(
                           5*width,
                           yPosition,
                           width,
                           height);
        
        color = [UIColor purpleColor];
        purpleView = [[NumberSelectorView alloc] initWithFrame:frame 
                                                           col:color 
                                                          text:title 
                                                             w:width 
                                                             h:height];

        UIImage *chips = [UIImage imageNamed:@"pokerchips.png"];
        NSLog(@"image.size = %f", triangle.size.width);
        pokerChipView = [[UIImageView alloc] initWithImage:chips];
        s = chips.size;
		pokerChipView.frame = CGRectMake(
                                        b.size.width - 50,
                                        b.origin.y + (b.size.height - s.height) / 2 - 160,
                                        s.width,
                                        s.height
                                        );
        
        frames = [NSArray arrayWithObjects: [NSValue valueWithCGRect:redView.frame], 
                                            [NSValue valueWithCGRect:orangeView.frame], 
                                            [NSValue valueWithCGRect:yellowView.frame], 
                                            [NSValue valueWithCGRect:greenView.frame], 
                                            [NSValue valueWithCGRect:blueView.frame], 
                                            [NSValue valueWithCGRect:purpleView.frame], 
                                             nil];
        
        NSLog(@"title = %@", redView.text);
        NSLog(@"frames.count = %d", frames.count);
        
        views = [NSArray arrayWithObjects: redView,
                 orangeView, 
                 yellowView,
                 greenView,
                 blueView,
                 purpleView, 
                 nil];
        
        bet = @"";

        
        //SEQUENCE OF ADDING VIEWS
        [self addSubview:rouletteWheel];
        [self addSubview:triangleView];
        [self addSubview: spin];
		//[self addSubview: label];
        [self addSubview:redView];
        [self addSubview:orangeView];
        [self addSubview:yellowView];
        [self addSubview:greenView];
        [self addSubview:blueView];
        [self addSubview:purpleView];
        
        [self addSubview: pokerChipView];
        [self addSubview:playAgain];

	}
	return self;
}

- (void) spinWheel:(id)sender {

    [viewController spinWheel:sender spinLayer:rouletteWheel.layer];
    text = [NSString stringWithFormat: @"The winning number is %d!", viewController.winningNumber];
    NSLog(@"winning Number = %@", text);
    label.text = text;
    NSLog(@"bet = %@", bet);
    if([bet isEqualToString:[NSString stringWithFormat:@"%d", viewController.winningNumber]]) {
        NSLog(@"you won!");
    }
    pokerChipView.center = CGPointMake(150, 150);
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	pokerChipView.backgroundColor = [UIColor greenColor];

}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	pokerChipView.center = [[touches anyObject] locationInView: self];
    NSLog(@"frame size = %f", greenView.frame.size.width);
    if(CGRectIntersectsRect(pokerChipView.frame, greenView.frame)) {
        NSLog(@"there is an intersection!");
    }
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	pokerChipView.backgroundColor = [UIColor yellowColor];
    if(CGRectIntersectsRect(pokerChipView.frame, greenView.frame)) {
        NSLog(@"there was an intersection!");
    }
    NumberSelectorView *j = [self findBet:pokerChipView.frame frames:views];
    if([j text] > 0) {
        NSLog(@"greater than 0, text = %@", j.text);
        bet = j.text;
    }
}

- (NumberSelectorView *) findBet: (CGRect) rect frames: (NSArray *) rects {
    for(int i = 0; i < rects.count; i++) {
        NumberSelectorView *imageView = [rects objectAtIndex:i];
        if(CGRectIntersectsRect(rect, imageView.frame)) {
            return imageView;
            
        }
    }
    
    return [NumberSelectorView alloc];
}


/*
- (void) drawRect: (CGRect) rect
{

}
*/

@end
