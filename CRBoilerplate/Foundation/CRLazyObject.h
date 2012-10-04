#import <Foundation/Foundation.h>

typedef id (^CRCreatorBlock)();

@interface CRLazyObject : NSProxy

- (id) initWithCreator:(CRCreatorBlock)creator;
+ (id) lazyObjectWithCreator:(CRCreatorBlock)creator;

@end
