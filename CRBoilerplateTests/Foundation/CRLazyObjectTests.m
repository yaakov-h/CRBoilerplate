#import <SenTestingKit/SenTestingKit.h>
#import "CRLazyObject.h"

@interface CRLazyObjectTests : SenTestCase

@end

@implementation CRLazyObjectTests

- (void) testInstantiatesObject
{
    __block int loadedCount = 0;
    
    id lazy = [[CRLazyObject alloc] initWithCreator:^
    id{
        loadedCount++;
        return @[];
    }];
    
    STAssertEquals(loadedCount, 0, @"Object should not be loaded yet");
    
    [lazy count];
    
    STAssertEquals(loadedCount, 1, @"Object should be loaded");
    
    [lazy count];
    
    STAssertEquals(loadedCount, 1, @"Object should be loaded only once");
}

- (void) testHasStandardBehaviourOnUndefinedSelector
{
    id lazy = [[CRLazyObject alloc] initWithCreator:^{ return @[]; }];
    BOOL hasException = NO;
    @try
    {
        [lazy performSelector:@selector(cr_thereIsNoWayThatThisIsActuallyAValidSelector:)];
    }
    @catch (NSException * exception) {
        hasException = YES;
        
        STAssertEqualObjects([exception name], @"NSInvalidArgumentException", @"Invalid Argument Exception should have been thrown by Objective-C Runtime");
        STAssertEqualObjects([exception reason], @"*** -[NSProxy doesNotRecognizeSelector:cr_thereIsNoWayThatThisIsActuallyAValidSelector:] called!", @"doesNotRecogniseSelector should be description");
    }
    
    STAssertTrue(hasException, @"Exception should have been thrown");
}

- (void) testRespondsNormallyToSelectors
{
    id lazy = [[CRLazyObject alloc] initWithCreator:^{
        return @[ @"one" ];
    }];
    
    STAssertTrue([lazy respondsToSelector:@selector(count)], @"lazy NSArray should respond to NSArray selectors");
    STAssertTrue([lazy respondsToSelector:@selector(objectAtIndex:)], @"lazy NSArray should respond to NSArray selectors");
    STAssertTrue([lazy respondsToSelector:@selector(objectAtIndexedSubscript:)], @"lazy NSArray should respond to NSArray selectors");
    
    STAssertEquals([lazy count], 1U, @"Array should have one item - forwarded properly");
    STAssertEqualObjects(lazy[0], @"one", @"Array item should be \"one\" - forwarded properly");
}

- (void) testCanInstantiateMultipleLazies
{
    // This test case came about because during development I accidentally made the dispatch token static.
    // This case tests against that case.
    
    id lazy1 = [[CRLazyObject alloc] initWithCreator:^{ return @"one"; }];
    id lazy2 = [[CRLazyObject alloc] initWithCreator:^{ return @"two"; }];
    
    STAssertTrue([lazy1 isEqualToString:@"one"], @"First lazy object should be \"one\"");
    STAssertTrue([lazy1 isEqual:@"one"], @"First lazy object should be \"one\"");
    STAssertEqualObjects(lazy1, @"one", @"First lazy object should be \"one\"");
    STAssertTrue([lazy2 isEqualToString:@"two"], @"Second lazy object should be \"two\"");
    STAssertTrue([lazy2 isEqual:@"two"], @"Second lazy object should be \"two\"");
    STAssertEqualObjects(lazy2, @"two", @"First lazy object should be \"one\"");
}

- (void) testLazyObjectHasSameHashAsObject
{
    NSNumber * object = @123456;
    id lazy = [[CRLazyObject alloc] initWithCreator:^{ return object; }];
    
    NSMutableDictionary * dictionary = [@{} mutableCopy];
    
    dictionary[object] = @"test";
    STAssertEquals([dictionary count], 1U, @"Dictionary should have one item");
    STAssertEqualObjects(dictionary[object], @"test", @"Retrieved value with object key should be same value set with object key - sanity check");
    STAssertEqualObjects(dictionary[lazy], @"test", @"Retrieved value with lazy key should be same value set with object key");
    
    dictionary[lazy] = @"test2";
    STAssertEquals([dictionary count], 1U, @"Dictionary should still only have one item");
    STAssertEqualObjects(dictionary[lazy], @"test2", @"Retrieved value with lazy key should be same value set with lazy key - sanity check");
    STAssertEqualObjects(dictionary[object], @"test2", @"Retrieved value with object key should be same value set with lazy key");
}

@end
