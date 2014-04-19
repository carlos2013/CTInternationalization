//
//  InternationalControl.h
//  MyInternational
//
//  Created by Carlos on 4/19/14.
//  Copyright (c) 2014 Carlos. All rights reserved.
//
/*Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
*in the Software without restriction, including without limitation the rights
*to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
*copies of the Software, and to permit persons to whom the Software is
*furnished to do so, subject to the following conditions:

*The above copyright notice and this permission notice shall be included in
*all copies or substantial portions of the Software.

*THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
*IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
*FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
*AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
*LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
*OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
*THE SOFTWARE.
*/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef CURRENT_BUNDLE
#define CURRENT_BUNDLE ([[InternationalizationManager sharedManager] bundle])
#endif
#define APP_LANGUAGE_CHANGED_NOTIFICATION @"AppLanguageChangedNotification"
#define CURRENT_USER_LANGUAGE @"currentUserLanguage"
@interface InternationalizationManager : NSObject

@property (strong, nonatomic) NSBundle *bundle;

/**
 *  shared manager
 *
 *  @return the singleton object of InternationalizationManager
 */
+(InternationalizationManager *)sharedManager;
/**
 *  init user language and update the bundle.
 */
- (void)initUserLanguage;

/**
 *  get current language
 *
 *  @return the string of current language, like "en", "zh-Hans"
 */
- (NSString *)userLanguage;

- (void)setUserlanguage:(NSString *)language;

@end