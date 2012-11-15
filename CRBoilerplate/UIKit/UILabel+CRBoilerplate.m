//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import "UILabel+CRBoilerplate.h"

@implementation UILabel (CRBoilerplate)

- (void) cr_autoResizeHeightForContent
{
    CGSize maxSize = CGSizeMake(self.frame.size.width, NSIntegerMax);
	
	CGSize newSize = [self.text sizeWithFont:self.font
                           constrainedToSize:maxSize
                               lineBreakMode:NSLineBreakByWordWrapping
                      ];
	
	if ( newSize.height < self.frame.size.height )
	{
		newSize.height = self.frame.size.height;
	}
	
	self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, newSize.height);
}

@end
