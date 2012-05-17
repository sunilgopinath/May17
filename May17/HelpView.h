//
//  HelpView.h
//  May17
//
//  Created by Sunil Gopinath on 5/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HelpViewController;

@interface HelpView : UIView <UIWebViewDelegate> {
	HelpViewController *modalViewController;
    
    UIWebView *webView;
}

- (id) initWithFrame: (CGRect) frame controller: (HelpViewController *) c;

@end
