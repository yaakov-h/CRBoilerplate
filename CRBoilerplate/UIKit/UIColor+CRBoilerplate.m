#import "UIColor+CRBoilerplate.h"

@implementation UIColor (CRBoilerplate)

+ (id) cr_colorWithRGBHexValue:(uint32_t)hexValue
{
	return [UIColor colorWithRed:((CGFloat)((hexValue & 0xFF0000 ) >> 16)) / 255.0
						   green:((CGFloat)((hexValue & 0x00FF00 ) >> 8 )) / 255.0
							blue:((CGFloat)((hexValue & 0x0000FF )      )) / 255.0
						   alpha:255.0
	 		];
}

+ (UIColor *) cr_colorWithHexString:(NSString *)hexString
{
    
    if (hexString == nil) {
        return nil;
    }
    
    NSScanner * scanner = [[NSScanner alloc] initWithString:hexString];
    unsigned int uValue;
	
    if ([scanner scanHexInt:&uValue])
	{
        return [UIColor cr_colorWithRGBHexValue:uValue];
    }
	else
	{
        return nil;
    }
}

@end
