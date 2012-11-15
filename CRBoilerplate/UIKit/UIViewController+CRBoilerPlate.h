//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CRBoilerPlate)

// If using this on a view controller where the view is a UIScrollView, you
// might want to use it in conjunction with -[UIScrollView cr_setContentView:]
// so that the contentSize is set correctly, and the entire contents remain
// scrollable.
@property (nonatomic, setter = cr_setResizesToFitKeyboard:) BOOL cr_resizesToFitKeyboard;

@end
