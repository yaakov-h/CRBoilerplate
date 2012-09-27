#import <Foundation/Foundation.h>
#import "CREnumerationTypes.h"

@interface NSArray (CREnumeration)

- (NSEnumerator *) cr_where:(CRWhereBlock)whereFilter;
- (NSEnumerator *) cr_select:(CRSelectBlock)transformation;
- (NSEnumerator *) cr_skip:(NSUInteger)skipCount;
- (NSEnumerator *) cr_take:(NSUInteger)takeCount;
- (NSEnumerator *) cr_selectMany;

- (BOOL) cr_any:(CRWhereBlock)whereFilter;
- (BOOL) cr_all:(CRWhereBlock)whereFilter;

- (id) cr_firstObject;

@end;