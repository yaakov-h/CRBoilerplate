//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import <Foundation/Foundation.h>
#import "CREnumerationTypes.h"

@interface NSEnumerator (CREnumeration)

- (NSEnumerator *) cr_where:(CRWhereBlock)whereFilter;
- (NSEnumerator *) cr_select:(CRSelectBlock)transformation;
- (NSEnumerator *) cr_skip:(NSUInteger)skipCount;
- (NSEnumerator *) cr_take:(NSUInteger)takeCount;
- (NSEnumerator *) cr_selectMany;

- (BOOL) cr_any:(CRWhereBlock)whereFilter;
- (BOOL) cr_all:(CRWhereBlock)whereFilter;

@end