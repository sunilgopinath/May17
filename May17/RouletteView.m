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
        
        b = self.bounds;

        // CREATE TITLE LABEL
        [self initTitleLabel];
        // CREATE HELP ICON
        [self initHelpIcon];
        // CREATE POINTER
        [self initPointer];
        // CREATE POKER CHIPS
        [self initPokerChips];
        // CREATE WHEEL
        [self initWheel];
        // CREATE PLAY BUTTON
        [self initPlayButton];
        [self initPlayAgain];
        [self initWinningNumberLabel];
        [self initTally];
        /*

        
        //CREATE POINTER

        


         */
        //CREATE NUMBER OPTIONS
        NSString *title = @"";
        CGFloat width = 53;
        CGFloat height = 60;
        CGFloat yPosition = self.bounds.origin.y + 360;
        UIColor *color;
        NSLog(@"width = %f", b.size.width);
        
        
        
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

        
        views = [NSArray arrayWithObjects: redView,
                 orangeView, 
                 yellowView,
                 greenView,
                 blueView,
                 purpleView, 
                 nil];
        
        bet = @"";
        money = 0;
        
        //SEQUENCE OF ADDING VIEWS
        [self addSubview:rouletteWheel];

        
		//[self addSubview: label];
        [self addSubview:redView];
        [self addSubview:orangeView];
        [self addSubview:yellowView];
        [self addSubview:greenView];
        [self addSubview:blueView];
        [self addSubview:purpleView];

        [self addSubview: titleLabel];
        [self addSubview:help];
        [self addSubview:triangleView];
        [self addSubview: pokerChipView];
        [self addSubview:play];
        
        //[self addSubview:playAgain];
        //[self addSubview:winningNumberLabel];
        [self addSubview:winnings];

	}
	return self;
}

- (void) spinWheel:(id)sender {
    
    NumberSelectorView *betPlaced = [self findBet:pokerChipView.frame frames:views];
    if([betPlaced text] > 0) {
        [viewController playCongratulations:sender];
        //make sure warning label is removed
        [warning removeFromSuperview];
        
        // find what number the user has bet on
        NSLog(@"greater than 0, text = %@", betPlaced.text);
        bet = betPlaced.text;
        
        // spin the wheel
        [viewController spinWheel:sender spinLayer:rouletteWheel.layer];
        
        // display the wheel's result
        text = [NSString stringWithFormat: @"The winning number is %d!", viewController.winningNumber];
        [self addSubview:winningNumberLabel];
        winningNumberLabel.text = text;
        [self animateWinningLabel];
        
        // compare the bet with the wheel result
        NSLog(@"bet = %@", bet);
        NSString *winningNumberConverted = [NSString stringWithFormat:@"%d", viewController.winningNumber];
        if([self didWin:bet win:winningNumberConverted]) {
            money += 10;
            [self initResultWin];
        } else {
            money--;
        }
        
        
        if(money > 0) {
            NSLog(@"money =  %d", money);
            winnings.textColor = [UIColor blackColor];
            
        } else {
            winnings.textColor = [UIColor redColor];
        }
        NSLog(@" SDFHSKDFLKSJDFLKJSDFLJS ");
        winnings.text = [NSString stringWithFormat:@"You are $%d", abs(money)];
        
        // clean up game
        [self afterSpingWheel];
        [self addSubview:playAgain];
        
    } else {
        
        //display warning label
        [self initWarningLabel];
        [self addSubview:warning];
        
    }
}

// cleans up view to disable user interaction
- (void) afterSpingWheel {
    
    play.userInteractionEnabled = NO;
    pokerChipView.userInteractionEnabled = NO;
    
}

- (void) playAgainYes {
    
    play.userInteractionEnabled = YES;
    [playAgain removeFromSuperview];
    [winningNumberLabel removeFromSuperview];
    pokerChipView.center = CGPointMake(b.size.width - 30, b.origin.y + 70);
    [result removeFromSuperview];
    
}

- (BOOL) didWin: (NSString *) b1 win:(NSString *) wn {
    
    if([b1 isEqualToString:wn]) {
        return YES;
    } 
    return NO;
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	pokerChipView.backgroundColor = [UIColor greenColor];

}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	pokerChipView.center = [[touches anyObject] locationInView: self];
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	pokerChipView.backgroundColor = [UIColor yellowColor];
}

// find an intersection
- (NumberSelectorView *) findBet: (CGRect) rect frames: (NSArray *) rects {
    for(int i = 0; i < rects.count; i++) {
        NumberSelectorView *imageView = [rects objectAtIndex:i];
        if(CGRectIntersectsRect(rect, imageView.frame)) {
            return imageView;
            
        }
    }
    
    return [NumberSelectorView alloc];
}

- (void) showHelp: (id) sender {
    [viewController presentModalViewController];
}

#pragma mark - Initialise subviews

- (void) initTitleLabel {
    
    NSString *string = @"Casino Big Wheel";
    UIFont *font = [UIFont fontWithName: @"Arial" size: 18.0];
    CGSize size = [string sizeWithFont: font];
    
    CGRect f = CGRectMake(
                          self.bounds.origin.x,
                          self.bounds.origin.y,
                          size.width,
                          size.height
                          );
    
    titleLabel = [[UILabel alloc] initWithFrame: f];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = font;
    titleLabel.text = string;
    titleLabel.textColor = [UIColor blueColor];

}

- (void) initWheel {
    
    UIImage *wheel = [UIImage imageNamed:@"wheelspinner.jpg"];
    NSLog(@"image.size = %f", wheel.size.width);
    rouletteWheel = [[UIImageView alloc] initWithImage:wheel];
    CGSize s = wheel.size;
    
    rouletteWheel.frame = CGRectMake(
                                     b.origin.x + (b.size.width - s.width) / 2,
                                     b.origin.y + (b.size.height - s.height) / 2 - 30,
                                     s.width,
                                     s.height
                                     );
}

- (void) initHelpIcon {
    
    help = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *helpIcon = [UIImage imageNamed:@"helpbtn.png"];
    [help setBackgroundImage:helpIcon forState:UIControlStateNormal]; 
    help.frame = CGRectMake(b.size.width - helpIcon.size.width - 10, 
                                 b.origin.y + 5,
                                 helpIcon.size.width,
                                 helpIcon.size.height
                                 );
    
    [help addTarget:self
                  action: @selector(showHelp:)
        forControlEvents: UIControlEventTouchUpInside
     ];

    
}

- (void) initPokerChips {
    
    UIImage *chips = [UIImage imageNamed:@"pokerchips.png"];
    pokerChipView = [[UIImageView alloc] initWithImage:chips];
    CGSize s = chips.size;
    pokerChipView.frame = CGRectMake(
                                     b.size.width - 50,
                                     b.origin.y + (b.size.height - s.height) / 2 - 160,
                                     s.width,
                                     s.height
                                     );

    
}

- (void) initPointer {
    
    UIImage *triangle = [UIImage imageNamed:@"triangle.png"];
    triangleView = [[UIImageView alloc] initWithImage:triangle];
    CGSize s = triangle.size;
    triangleView.frame = CGRectMake(
                                    b.origin.x + (b.size.width - s.width) / 2,
                                    b.origin.y + (b.size.height - s.height) / 2 - 160,
                                    s.width,
                                    s.height
                                    );
}

- (void) initPlayButton {
    
    play = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *playImageDown = [UIImage imageNamed:@"02.png"];
    UIImage *playImageUp = [UIImage imageNamed:@"01.png"];
    [play setBackgroundImage:playImageUp forState:UIControlStateNormal];
    [play setBackgroundImage:playImageDown forState:UIControlEventTouchDown];
    
    play.frame = CGRectMake(b.size.width - playImageDown.size.width - 10, 
                                 b.size.height - playImageDown.size.height - 110,
                                 playImageDown.size.width,
                                 playImageDown.size.height
                                 );
    
    [play addTarget:self
                  action: @selector(spinWheel:)
        forControlEvents: UIControlEventTouchUpInside
     ];
    
}

- (void) initPlayAgain {
    
    playAgain = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *playAgainImage = [UIImage imageNamed:@"playagain.gif"];
    [playAgain setBackgroundImage:playAgainImage forState:UIControlStateNormal];
    

    CGSize s = playAgainImage.size;
    
    playAgain.frame = CGRectMake(b.origin.x + (b.size.width - s.width) / 2,
                                 b.origin.y + (b.size.height - s.height) / 2,
                                 s.width,
                                 s.height
                                 );
    
    
    [playAgain addTarget:self
                        action: @selector(playAgainYes)
              forControlEvents: UIControlEventTouchUpInside
     ];
    
}

- (void) initWinningNumberLabel {
    
    // CREATE WINNING NUMBER LABEL
    text = [NSString stringWithFormat: @"The winning number is %d!", viewController.winningNumber];
    UIFont *font = [UIFont fontWithName: @"Arial" size: 16.0];
    CGSize s = [text sizeWithFont: font];
    CGRect f = CGRectMake(
                          b.origin.x,
                          b.origin.y + 20,
                          s.width,
                          s.height
                          );
    
    winningNumberLabel = [[UILabel alloc] initWithFrame: f];
    winningNumberLabel.backgroundColor = [UIColor clearColor];
    winningNumberLabel.font = font;
    winningNumberLabel.textColor = [UIColor blackColor];
    winningNumberLabel.alpha = 0.0;

}

- (void) initResultWin {
    
    //Trailing blank to avoid cutting off last letter
    //because italic leans to the right.
    NSString *str = @"CONGRATULATIONS ";
    
    UIFont *font = [UIFont italicSystemFontOfSize: 30];
    CGSize size = [str sizeWithFont: font];
    
    CGRect f = CGRectMake(
                          b.size.width,
                          0,
                          size.width,
                          size.height
                          );
    
    result = [[UILabel alloc] initWithFrame: f];
    result.font = font;
    result.backgroundColor = [UIColor clearColor];
    result.textColor = [UIColor whiteColor];
    result.text = str;
    [self addSubview: result];
    [self animateWin];
    
}

- (void) animateWin {
    
    [UIView animateWithDuration: 10
                          delay: 1
                        options: UIViewAnimationOptionCurveLinear
                     animations: ^{
                         //Move the label far enough to the left
                         //so that it's out of the View.
                         result.center = CGPointMake(
                                                    -result.bounds.size.width / 2,
                                                    self.bounds.size.height / 2
                                                    );
                     }
                     completion: NULL
     ];
    
}

- (void) initWarningLabel {
    
    // CREATE WINNING NUMBER LABEL
    text = [NSString stringWithFormat: @"You must place a bet to play"];
    UIFont *font = [UIFont fontWithName: @"Arial" size: 16.0];
    CGSize s = [text sizeWithFont: font];
    CGRect f = CGRectMake(
                          b.origin.x,
                          b.origin.y + 20,
                          s.width,
                          s.height
                          );
    
    warning = [[UILabel alloc] initWithFrame: f];
    warning.backgroundColor = [UIColor clearColor];
    warning.font = font;
    warning.textColor = [UIColor blackColor];
    warning.text = text;
}

- (void) animateWinningLabel {
    
    [UIView animateWithDuration: 1
                          delay: 1
                        options: UIViewAnimationOptionCurveLinear
                     animations: ^{
                         winningNumberLabel.alpha = 1.0;
                         winnings.alpha = 1.0;
                     }
                     completion: NULL
     ];
    
}

- (void) initTally {
    
    // CREATE WINNING NUMBER LABEL
    text = [NSString stringWithFormat: @"You are $0"];
    UIFont *font = [UIFont fontWithName: @"Arial" size: 16.0];
    CGSize s = [text sizeWithFont: font];
    CGRect f = CGRectMake(
                          b.origin.x,
                          b.origin.y + 40,
                          s.width,
                          s.height
                          );
    
    winnings = [[UILabel alloc] initWithFrame: f];
    winnings.backgroundColor = [UIColor clearColor];
    winnings.font = font;
    winnings.textColor = [UIColor blackColor];
    winnings.text = text;
    winnings.alpha = 0.0;
}
/*
- (void) drawRect: (CGRect) rect
{

}
*/

@end
