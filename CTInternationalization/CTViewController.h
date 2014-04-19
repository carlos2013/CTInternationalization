//
//  CTViewController.h
//  CTInternationalization
//
//  Created by 赵从挺 on 4/19/14.
//  Copyright (c) 2014 carlos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIButton *myButton;
- (IBAction)buttonClicked:(id)sender;
@end
