#import "UIImage+CRBoilerplate.h"
#import "UIColor+CRBoilerplate.h"

@implementation UIImage (CRBoilerplate)

- (UIImage *) cr_greyscaleImage
{
	CGFloat scale = self.scale;
	int width = self.size.width * scale;
	int height = self.size.height * scale;
	
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
	
	CGContextRef context = CGBitmapContextCreate (nil,
												  width,
												  height,
												  8,      // bits per component
												  0,
												  colorSpace,
												  kCGImageAlphaNone);
	
	CGColorSpaceRelease(colorSpace);
	
	if (context == NULL) {
		return nil;
	}
	
	CGContextDrawImage(context,
					   CGRectMake(0, 0, width, height), self.CGImage);
	
    CGImageRef greyCGImage = CGBitmapContextCreateImage(context);
	UIImage *grayImage = [UIImage imageWithCGImage:greyCGImage scale:scale orientation:UIImageOrientationUp];
    CFRelease(greyCGImage);
    
	CGContextRelease(context);
	
	return grayImage;
}

- (UIImage *) cr_imageWithOverlayColor:(UIColor *)color mask:(UIImage *)maskImage
{
    CGRect rect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
	UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
	
    CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
	CGContextSetBlendMode(context, kCGBlendModeSourceIn);
	CGContextClipToMask(context, rect, self.CGImage);
	
	CGContextSetFillColorWithColor(context, [[UIColor cr_colorWithRGBHexValue:0x2E2B2A] CGColor]);
	CGContextFillRect(context, rect);
	
	CGContextClipToMask(context, rect, [maskImage cr_greyscaleImage].CGImage);
	
	CGContextSetFillColorWithColor(context, color.CGColor);
	CGContextFillRect(context, rect);
	
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
