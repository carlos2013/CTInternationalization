CTInternationalization
======================

A pretty easy way to change the app language without restart your app.

How to use?


1. Drag InternationalizationManager.h and Internationalization.m to your project.

2. Add a string resource file to your project. And then localize it.

3. In your view controller, register to notification center to receive notifications when language changed.

[[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(languageChanged) name:APP_LANGUAGE_CHANGED_NOTIFICATION object:nil];

and in the "languageChanged", write you code like this:
self.myLabel.text = NSLocalizedStringFromTableInBundle(@"easy", @"Internationalization", CURRENT_BUNDLE, nil);
here CURRENT_BUNDLE is a macro I have defined for you, just use it.

4. In the function where you are going to change the app language, call

  [[InternationalizationManager sharedManager] setUserlanguage:@"your language such as en"];

and then post a notification to change the app's language.

[[NSNotificationCenter defaultCenter] postNotificationName:APP_LANGUAGE_CHANGED_NOTIFICATION object:nil];


Thanks:
Many thanks to atany since some ideas are come from his article http://blog.csdn.net/yang8456211/article/details/12031667 and I added an easy way to work with.
