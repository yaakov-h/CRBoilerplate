//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import "UIViewController+CRBoilerPlate.h"
#import <objc/runtime.h>

@interface UIViewController (CRBoilerPlate_Private)

@property (nonatomic, setter = cr_set_internal_resizesToFitKeyboard:) BOOL cr_internal_resizesToFitKeyboard;

@end

@implementation UIViewController (CRBoilerPlate_Private)

- (BOOL) cr_internal_resizesToFitKeyboard
{
	id number = objc_getAssociatedObject(self, "_cr_internal_resizesToFitKeyboard");
	return [number boolValue];
}

- (void) cr_set_internal_resizesToFitKeyboard:(BOOL)cr_internal_resizesToFitKeyboard
{
	NSNumber * number = @(cr_internal_resizesToFitKeyboard);
	objc_setAssociatedObject(self, "_cr_internal_resizesToFitKeyboard", number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@implementation UIViewController (CRBoilerPlate)

- (BOOL) cr_resizesToFitKeyboard
{
	return self.cr_internal_resizesToFitKeyboard;
}

- (void) cr_setResizesToFitKeyboard:(BOOL)resizesToFitKeyboard
{
	if (self.cr_internal_resizesToFitKeyboard != resizesToFitKeyboard)
	{
		if (resizesToFitKeyboard)
		{
			[self cr_addKeyboardNotificationViewHandlers];
		}
		else
		{
			[self cr_removeKeyboardNotificationViewHandlers];
		}
		
		self.cr_internal_resizesToFitKeyboard = resizesToFitKeyboard;
	}
}

//
// Taken from DerpKit: https://github.com/amazingsyco/DerpKit/
// Original name: -derp_addKeyboardViewHandlers:
//
- (void) cr_addKeyboardNotificationViewHandlers
{
	NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
	id willShow = [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillShowNotification object:nil queue:mainQueue usingBlock:^(NSNotification * note)
	{
		if (self.isViewLoaded && self.view.window)
		{
			NSLog(@"notif: %@",[note userInfo]);
			CGRect keyboardFrame = [(NSValue *)note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
			CGRect viewFrame = self.view.frame;
			viewFrame.size.height -= keyboardFrame.size.height;
			
			[UIView beginAnimations:@"UIKeyboard" context:nil];
			
			[UIView setAnimationDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]];
			[UIView setAnimationCurve:[note.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue]];
			
			self.view.frame = viewFrame;
			
			[UIView commitAnimations];
		};
	}];
	
	id willHide = [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillHideNotification object:nil queue:mainQueue usingBlock:^(NSNotification * note)
	{
		if (self.isViewLoaded && self.view.window)
		{
			NSLog(@"notif: %@",[note userInfo]);
			CGRect keyboardFrame = [(NSValue *)note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
			CGRect viewFrame = self.view.frame;
			viewFrame.size.height += keyboardFrame.size.height;
			
			[UIView beginAnimations:@"UIKeyboard" context:nil];
			
			[UIView setAnimationDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]];
			[UIView setAnimationCurve:[note.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue]];
			
			self.view.frame = viewFrame;
			
			[UIView commitAnimations];
		};
	}];
	
	objc_setAssociatedObject(self, "_cr_willShowKeyboardNotification", willShow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	objc_setAssociatedObject(self, "_cr_willHideKeyboardNotification", willHide, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


//
// Taken from DerpKit: https://github.com/amazingsyco/DerpKit/
// Original name: -derp_removeKeyboardViewHandlers:
//
- (void) cr_removeKeyboardNotificationViewHandlers
{
	id willShow = objc_getAssociatedObject(self, "_cr_willShowKeyboardNotification");
	id willHide = objc_getAssociatedObject(self, "_cr_willHideKeyboardNotification");
	
	if (willShow)
	{
		[[NSNotificationCenter defaultCenter] removeObserver:willShow];
		objc_setAssociatedObject(self, "_cr_willShowKeyboardNotification", nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}
	
	if (willHide)
	{
		[[NSNotificationCenter defaultCenter] removeObserver:willHide];
		objc_setAssociatedObject(self, "_cr_willHideKeyboardNotification", nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}
}

@end
