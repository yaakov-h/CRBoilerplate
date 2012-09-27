#import "CREnumerator.h"

@interface CRSkipEnumerator : CREnumerator

- (id) initWithEnumerator:(NSEnumerator *)enumerator skipCount:(NSUInteger)skipCount;

@end
