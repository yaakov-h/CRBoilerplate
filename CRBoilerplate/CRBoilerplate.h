//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import <Foundation/Foundation.h>

// Logs a message, but also tells you where it was logged from.
// Disabled in release builds
#if defined(DEBUG) && DEBUG
#	define CRLog(fmt, ...) NSLog((@"%s (Line %d): " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#	define CRLog(fmt, ...)
#endif

#import <CRBoilerplate/CRDataReader.h>
#import <CRBoilerplate/CRLazyObject.h>
#import <CRBoilerplate/NSArray+CREnumeration.h>
#import <CRBoilerplate/NSEnumerator+CREnumeration.h>
#import <CRBoilerplate/NSData+CRBoilerplate.h>
#import <CRBoilerplate/NSUserDefaults+CRBoilerplate.h>

#if TARGET_OS_IPHONE
#	import <CRBoilerplate/UIApplication+CRBoilerplate.h>
#	import <CRBoilerplate/UIColor+CRBoilerplate.h>
#	import <CRBoilerplate/UIImage+CRBoilerplate.h>
#	import <CRBoilerplate/UILabel+CRBoilerplate.h>
#	import <CRBoilerplate/UIScrollView+CRBoilerplate.h>
#	import <CRBoilerplate/UIViewController+CRBoilerplate.h>
#endif