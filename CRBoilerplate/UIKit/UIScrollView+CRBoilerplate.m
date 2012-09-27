#import "UIScrollView+CRBoilerplate.h"

@implementation UIScrollView (CRBoilerplate)

- (void) cr_setContentView:(UIView *)contentView
{
	[self addSubview:contentView];
	
	contentView.frame = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, contentView.frame.size.height);
	
	self.contentSize = contentView.frame.size;
}

@end
