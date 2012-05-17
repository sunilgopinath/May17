//
//  HelpView.m
//  May17
//
//  Created by Sunil Gopinath on 5/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HelpView.h"
#import "HelpViewController.h"

@implementation HelpView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id) initWithFrame: (CGRect) frame controller: (HelpViewController *) c {
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor orangeColor];
		self.userInteractionEnabled = YES;
		modalViewController = c;
        
        webView = [[UIWebView alloc] initWithFrame:self.bounds];
        webView.delegate= self;
        [webView  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@
                                                            "http://en.wikipedia.org/wiki/Big_Six_wheel"]]];
        [self addSubview:webView];
        
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
