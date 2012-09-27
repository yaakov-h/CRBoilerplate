#import <UIKit/UIKit.h>

@interface UIViewController (CRBoilerPlate)

// If using this on a view controller where the view is a UIScrollView, you
// might want to use it in conjunction with -[UIScrollView cr_setContentView:]
// so that the contentSize is set correctly, and the entire contents remain
// scrollable.
@property (nonatomic, setter = cr_setResizesToFitKeyboard:) BOOL cr_resizesToFitKeyboard;

@end
