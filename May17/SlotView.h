//
//  SlotView.h
//  May17
//
//  Created by Sunil Gopinath on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SlotViewController;

@interface SlotView : UITextView {
    SlotViewController *viewController;
    UIButton *button;
    UIButton *playAgainbutton;
    UILabel *label;
}

- (id) initWithFrame: (CGRect) frame controller: (SlotViewController *) c;

@end
