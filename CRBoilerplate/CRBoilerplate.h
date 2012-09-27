#import <Foundation/Foundation.h>

// Logs a message, but also tells you where it was logged from.
// Disabled in release builds
#if defined(DEBUG) && DEBUG
#	define CRLog(fmt, ...) NSLog((@"%s (Line %d): " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#	define CRLog(fmt, ...)
#endif

#import "NSArray+CREnumeration.h"
#import "NSData+CRBoilerplate.h"
#import "NSEnumerator+CREnumeration.h"
#import "NSUserDefaults+CRBoilerplate.h"

#if TARGET_OS_IPHONE
#	import "UIApplication+CRBoilerplate.h"
#	import "UIColor+CRBoilerplate.h"
#	import "UIImage+CRBoilerplate.h"
#	import "UILabel+CRBoilerplate.h"
#	import "UIViewController+CRBoilerplate.h"
#endif