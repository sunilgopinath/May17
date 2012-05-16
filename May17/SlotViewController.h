//
//  SlotViewController.h
//  May17
//
//  Created by Sunil Gopinath on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFillingComponent 0
#define kBreadComponent 1

@interface SlotViewController : UIViewController<UIPickerViewDelegate> {
	NSString *text;

    NSArray *column1;
    NSArray *column2;
    NSArray *column3;
    NSArray *column4;
    NSArray *column5;
    UIPickerView *picker;
}

- (id) initWithText: (NSString *) t
              title: (NSString *) title
              image: (UIImage *) image
              badge: (NSString *) badge;

@property (nonatomic, copy) IBOutlet NSString *text;
@property (nonatomic, strong) UIPickerView *picker;

@property (nonatomic,strong) NSArray *column1;
@property (nonatomic,strong) NSArray *column2;
@property (nonatomic,strong) NSArray *column3;
@property (nonatomic,strong) NSArray *column4;
@property (nonatomic,strong) NSArray *column5;
@end
