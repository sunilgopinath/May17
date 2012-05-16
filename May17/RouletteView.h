//
//  RouletteView.h
//  May17
//
//  Created by Sunil Gopinath on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RouletteViewController;

@interface RouletteView : UITextView {
	RouletteViewController *viewController;
}

- (id) initWithFrame: (CGRect) frame controller: (RouletteViewController *) c;
- (void) spinWheel: (id) sender;

@end
