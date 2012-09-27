#import "UIApplication+CRBoilerplate.h"

@implementation UIApplication (CRBoilerplate)

- (void) cr_clearApplicationBadgeAndNotifications
{
	// If the badge count is already 0, setting it to 0 won't clear notifications
	self.applicationIconBadgeNumber = 1;
	self.applicationIconBadgeNumber = 0;
}

@end
