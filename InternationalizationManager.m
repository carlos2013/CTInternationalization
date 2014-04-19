//
//  InternationalControl.m
//  MyInternational
//
//  Created by Carlos on 4/19/14.
//  Copyright (c) 2014 Carlos. All rights reserved.
//

#import "InternationalizationManager.h"

@implementation InternationalizationManager


+(InternationalizationManager *)sharedManager{
    static InternationalizationManager *manager = nil;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        manager = [[InternationalizationManager alloc]init];
    });
    return manager;
}

-(id)init{
    if (self = [super init]) {
        [self initUserLanguage];
    }
    return self;
}

/**
 *  init user language and save to user default.
 */
-(void)initUserLanguage{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *string = [userDefault valueForKey:CURRENT_USER_LANGUAGE];
    
    //if user have not set a prefered language in the App, we will get the system prefered language.
    if(string.length == 0){
        //get current language of system
        NSString *currentLanguage = [[userDefault objectForKey:@"AppleLanguages"] objectAtIndex:0];
        [userDefault setValue:currentLanguage forKey:CURRENT_USER_LANGUAGE];
        [userDefault synchronize];
    }
    
    //get filepath
    NSString *path = [[NSBundle mainBundle] pathForResource:string ofType:@"lproj"];
    //init the bundle
    _bundle = [NSBundle bundleWithPath:path];
}

/**
 *  get the language setted by user in the app
 *
 *  @return the language setted by user
 */
-(NSString *)userLanguage{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    NSString *language = [userDefault valueForKey:CURRENT_USER_LANGUAGE];
    
    return language;
}

/**
 *  set a new language for the app
 *
 *  @param language the language you want to set. like @"en", @"zh-Hans"
 */
- (void)setUserlanguage:(NSString *)language{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj" ];
    
    //update bundle
    _bundle = [NSBundle bundleWithPath:path];
    
    //save current user language
    [userDefault setValue:language forKey:CURRENT_USER_LANGUAGE];
    [userDefault synchronize];
}


@end
