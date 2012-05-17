//
//  RouletteView.h
//  May17
//
//  Created by Sunil Gopinath on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@class NumberSelectorView;

@class RouletteViewController;

@interface RouletteView : UIView {
	
    RouletteViewController *viewController;
    
    CGRect b; //holder for self.bounds so we can use globally

    //title label
    UILabel *titleLabel;
    //help button
    UIButton *help;
    //play again
    UIButton *playAgain;
    
    UIImageView *rouletteWheel;
    UIImageView *triangleView;
    UIButton *play;
    UILabel *winningNumberLabel;
    NSString *text;
    
    NumberSelectorView *redView;
    NumberSelectorView *orangeView;
    NumberSelectorView *yellowView;
    NumberSelectorView *greenView;
    NumberSelectorView *blueView;
    NumberSelectorView *purpleView;
    NSArray *frames;
    NSArray *views;
    
    NSString *bet;
    
    UIImageView *pokerChipView;
    
    UILabel *result;
}

- (id) initWithFrame: (CGRect) frame controller: (RouletteViewController *) c;
- (void) spinWheel: (id) sender;
//- (CGRect) findBet: (CGRect) rect view: (NSArray *) views;

@end
