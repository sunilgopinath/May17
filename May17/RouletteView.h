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
    UIImageView *rouletteWheel;
    UIImageView *triangleView;
    UIButton *spin;
    UIButton *playAgain;
    UILabel *label;
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
}

- (id) initWithFrame: (CGRect) frame controller: (RouletteViewController *) c;
- (void) spinWheel: (id) sender;
//- (CGRect) findBet: (CGRect) rect view: (NSArray *) views;

@end
