//
//  CTViewController.m
//  CTInternationalization
//
//  Created by 赵从挺 on 4/19/14.
//  Copyright (c) 2014 carlos. All rights reserved.
//

#import "CTViewController.h"
#import "InternationalizationManager.h"
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
@interface CTViewController ()

@end

@implementation CTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myLabel.text = NSLocalizedStringFromTableInBundle(@"easy", @"Internationalization", CURRENT_BUNDLE, nil);
    [self.myButton setTitle:NSLocalizedStringFromTableInBundle(@"buttonTitle", @"Internationalization", CURRENT_BUNDLE, nil) forState:UIControlStateNormal];
    //Register notification center to receive notifications.
    [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(languageChanged) name:APP_LANGUAGE_CHANGED_NOTIFICATION object:nil];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification function

- (void)languageChanged{
    self.myLabel.text = NSLocalizedStringFromTableInBundle(@"easy", @"Internationalization", CURRENT_BUNDLE, nil);
    [self.myButton setTitle:NSLocalizedStringFromTableInBundle(@"buttonTitle", @"Internationalization", CURRENT_BUNDLE, nil) forState:UIControlStateNormal];
}

#pragma mark - IBActions

-(void)buttonClicked:(id)sender{
    NSString *lastLanguage = [[InternationalizationManager sharedManager] userLanguage];
    if ([lastLanguage isEqualToString:@"en"]) {
        //change language
        [[InternationalizationManager sharedManager] setUserlanguage:@"zh-Hans"];
    } else {
        [[InternationalizationManager sharedManager] setUserlanguage:@"en"];
    }
    //post a notification to update the text of UI.
    [[NSNotificationCenter defaultCenter] postNotificationName:APP_LANGUAGE_CHANGED_NOTIFICATION object:nil];
}
@end
