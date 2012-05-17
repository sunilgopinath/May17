//
//  NumberSelectorView.h
//  May17
//
//  Created by Sunil Gopinath on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NumberSelectorView : UIView {
    UILabel *label;
    NSString *text;
}

- (id) initWithFrame: (CGRect) frame 
                 col: (UIColor *) color 
                text: (NSString *) text
                   w: (CGFloat) width
                   h: (CGFloat) height;

- (id) initWithFrame: (CGRect) frame 
                 col: (UIColor *) color
                text: (NSString *) title;

@property (nonatomic) NSString *text;

@end
