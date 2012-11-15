//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import "CREnumerator.h"

@interface CRTakeEnumerator : CREnumerator

- (id) initWithEnumerator:(NSEnumerator *)enumerator takeCount:(NSUInteger)takeCount;

@end
