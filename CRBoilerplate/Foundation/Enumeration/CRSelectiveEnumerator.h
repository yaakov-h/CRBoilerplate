#import "CREnumerator.h"

@interface CRSelectiveEnumerator : CREnumerator

- (id) initWithEnumerator:(NSEnumerator *)enumerator filter:(CRWhereBlock)filter;

@end
