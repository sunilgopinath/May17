//
//  SlotViewController.m
//  May17
//
//  Created by Sunil Gopinath on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SlotViewController.h"
#import "SlotView.h"
#import "CelebrationViewController.h"

@interface SlotViewController ()

@end

@implementation SlotViewController
@synthesize text;
@synthesize picker, column1, column2, column3, column4, column5;
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

- (id) initWithText: (NSString *) t
              title: (NSString *) title
              image: (UIImage *) image
              badge: (NSString *) badge {
    
	self = [super initWithNibName: nil bundle: nil];
	if (self != nil) {
		self.title = title;
		self.tabBarItem.image = image;
		self.tabBarItem.badgeValue = badge;
		self.text = t;		//text = [t copy];
	}
	
    picker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    picker.delegate = self;
    picker.showsSelectionIndicator = YES;
    picker.userInteractionEnabled = NO;
    [self.view addSubview:picker];
    self.view.backgroundColor = [UIColor blueColor];	
    return self;
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void) loadView
{
	[super loadView];
    CGRect frame = [UIScreen mainScreen].applicationFrame;
	self.view = [[SlotView alloc] initWithFrame: frame controller: self];
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *seven = [UIImage imageNamed:@"seven.png"];
    UIImage *bar = [UIImage imageNamed:@"bar.png"];
    UIImage *crown = [UIImage imageNamed:@"crown.png"];
    UIImage *cherry = [UIImage imageNamed:@"cherry.png"];
    UIImage *lemon = [UIImage imageNamed:@"lemon.png"];
    UIImage *apple = [UIImage imageNamed:@"apple.png"];
    
    for(int i =1; i<=5; i++)
    {
        UIImageView *sevenView = [[UIImageView alloc] initWithImage:seven];
        UIImageView *barView = [[UIImageView alloc] initWithImage:bar];
        UIImageView *crownView = [[UIImageView alloc] initWithImage:crown];
        UIImageView *cherryView = [[UIImageView alloc] initWithImage:cherry];
        UIImageView *lemonView = [[UIImageView alloc] initWithImage:lemon];
        UIImageView *appleView = [[UIImageView alloc] initWithImage:apple];
        
        
        NSArray *imageViewArray = [[NSArray alloc] initWithObjects:
                                   sevenView,barView, crownView,cherryView,lemonView,appleView,nil];
        
        NSString *fieldName = [[NSString alloc] initWithFormat:@"column%d",i];
        [self setValue:imageViewArray forKey:fieldName];

    }
    srandom(time(NULL));
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [self.column1 count];
}

-(UIView *)pickerView:(UIPickerView *)pickerView
           viewForRow:(NSInteger)row
         forComponent:(NSInteger)component reusingView:(UIView *)view
{
    NSString *arrayName = [[NSString alloc] initWithFormat:@"column%d",component+1];
    NSArray *array = [self valueForKey:arrayName];
    return [array objectAtIndex:row];
}

- (void) presentModalViewController {
	[self presentModalViewController:
     [[UINavigationController alloc] initWithRootViewController:
      [[CelebrationViewController alloc] initWithNibName: nil bundle: nil]
      ]
                            animated: YES
     ];}


@end
