#import <Foundation/Foundation.h>

// Logs a message, but also tells you where it was logged from.
// Disabled in release builds
#if defined(DEBUG) && DEBUG
#	define CRLog(fmt, ...) NSLog((@"%s (Line %d): " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#	define CRLog(fmt, ...)
#endif

#import "Foundation/Enumeration/NSArray+CREnumeration.h"
#import "Foundation/Enumeration/NSEnumerator+CREnumeration.h"
#import "Foundation/NSData+CRBoilerplate.h"
#import "Foundation/NSUserDefaults+CRBoilerplate.h"

#if TARGET_OS_IPHONE
#	import "UIKit/UIApplication+CRBoilerplate.h"
#	import "UIKit/UIColor+CRBoilerplate.h"
#	import "UIKit/UIImage+CRBoilerplate.h"
#	import "UIKit/UILabel+CRBoilerplate.h"
#	import "UIKit/UIScrollView+CRBoilerplate.h"
#	import "UIKit/UIViewController+CRBoilerplate.h"
#endif