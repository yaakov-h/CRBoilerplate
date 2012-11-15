//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import <Foundation/Foundation.h>

typedef id (^CRCreatorBlock)();

@interface CRLazyObject : NSProxy

- (id) initWithCreator:(CRCreatorBlock)creator;
+ (id) lazyObjectWithCreator:(CRCreatorBlock)creator;

@end
