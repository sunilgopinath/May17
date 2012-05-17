//
//  NumberSelectorView.m
//  May17
//
//  Created by Sunil Gopinath on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NumberSelectorView.h"
#import "RouletteViewController.h"

@implementation NumberSelectorView
@synthesize text;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
		NSString *string = @"Hello, World!";
		UIFont *font = [UIFont systemFontOfSize: 32];
		CGSize size = [string sizeWithFont: font];
        
		//Put upper left corner of label in upper left corner of View.
		//Make label just big enough to hold the string.
		CGRect f = CGRectMake(
                              self.bounds.origin.x,
                              self.bounds.origin.y,
                              size.width,
                              size.height
                              );
        
        label = [[UILabel alloc] initWithFrame: f];
		label.backgroundColor = [UIColor yellowColor];
		label.font = font;
		label.text = string;
		[self addSubview: label];

    }
    return self;
}

- (id) initWithFrame: (CGRect) frame 
                  col: (UIColor *) color
                 text: (NSString *) title 
                    w: (CGFloat) width
                    h: (CGFloat) height {
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.text = title;
		//Put upper left corner of label in upper left corner of View.
		//Make label just big enough to hold the string.
		CGRect f = CGRectMake(
                              self.bounds.origin.x,
                              self.bounds.origin.y,
                              width,
                              height
                              );
        
        label = [[UILabel alloc] initWithFrame: f];
		label.backgroundColor = color;
		label.text = title;
        label.textColor = [UIColor whiteColor];
		[self addSubview: label];
	}
	return self;
}

- (id) initWithFrame: (CGRect) frame 
                 col: (UIColor *) color
                text: (NSString *) title  {
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
        self.backgroundColor = [UIColor whiteColor];
        //self.width = width;
        //self.height = height;
		//Put upper left corner of label in upper left corner of View.
		//Make label just big enough to hold the string.
		CGRect f = CGRectMake(
                              self.bounds.origin.x,
                              self.bounds.origin.y,
                              53,
                              60
                              );
        
        label = [[UILabel alloc] initWithFrame: f];
		label.backgroundColor = color;
		label.text = title;
        label.textColor = [UIColor whiteColor];
		[self addSubview: label];
	}
	return self;
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
