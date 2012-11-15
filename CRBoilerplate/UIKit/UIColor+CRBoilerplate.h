//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import <UIKit/UIKit.h>

@interface UIColor (CRBoilerplate)

+ (id) cr_colorWithRGBHexValue:(uint32_t)hexValue;
+ (UIColor *) cr_colorWithHexString:(NSString *)hexString;

@end
