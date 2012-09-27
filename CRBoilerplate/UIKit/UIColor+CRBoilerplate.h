#import <UIKit/UIKit.h>

@interface UIColor (CRBoilerplate)

+ (id) cr_colorWithRGBHexValue:(uint32_t)hexValue;
+ (UIColor *) cr_colorWithHexString:(NSString *)hexString;

@end
