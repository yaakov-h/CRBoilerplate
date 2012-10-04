#import "CRLazyObject.h"

@implementation CRLazyObject
{
    id _object;
    CRCreatorBlock _creator;
    dispatch_once_t _onceToken;
}

- (id) initWithCreator:(CRCreatorBlock)creator
{
    // no [super init] because we're inheriting from NSProxy
    
    _object = nil;
    _creator = [creator copy];
  
    return self;
}

+ (id) lazyObjectWithCreator:(CRCreatorBlock)creator
{
    return [[self alloc] initWithCreator:creator];
}

- (NSString *) description
{
    return [[self lazyLoadedObject] description];
}

- (id) lazyLoadedObject
{
    dispatch_once(&_onceToken, ^{
        _object = _creator();
    });
    
    return _object;
}

- (void) forwardInvocation:(NSInvocation *)invocation
{
    [invocation setTarget:[self lazyLoadedObject]];
    [invocation invoke];
    return;
}

- (NSMethodSignature *) methodSignatureForSelector:(SEL)aSelector
{
    return [[self lazyLoadedObject] methodSignatureForSelector:aSelector];
}

- (BOOL) isEqual:(id)object
{
    return [[self lazyLoadedObject] isEqual:object];
}

- (NSUInteger) hash
{
    return [[self lazyLoadedObject] hash];
}

@end
