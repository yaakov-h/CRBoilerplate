//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import <UIKit/UIKit.h>

@interface UIImage (CRBoilerplate)

// maskImage must be a black-and-white image represting the alpha mask to apply.
- (UIImage *) cr_imageWithOverlayColor:(UIColor *)color mask:(UIImage *)maskImage;
- (UIImage *) cr_greyscaleImage;

@end
