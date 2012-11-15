//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import "CREnumerator.h"

@interface CRSkipEnumerator : CREnumerator

- (id) initWithEnumerator:(NSEnumerator *)enumerator skipCount:(NSUInteger)skipCount;

@end
