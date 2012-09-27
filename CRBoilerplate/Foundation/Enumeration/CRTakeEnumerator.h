#import "CREnumerator.h"

@interface CRTakeEnumerator : CREnumerator

- (id) initWithEnumerator:(NSEnumerator *)enumerator takeCount:(NSUInteger)takeCount;

@end
