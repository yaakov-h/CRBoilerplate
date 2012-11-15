//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import <SenTestingKit/SenTestingKit.h>
#import "NSData+CRBoilerplate.h"

@interface NSDataExtensionsTest : SenTestCase

@end

@implementation NSDataExtensionsTest

- (void) testHexadecimalStringValueIsComputedCorrectly
{
    uint8_t testBytes[] = { 0xc9, 0xb0, 0xf3, 0xfb, 0x88, 0x78, 0x28, 0x7e,
        0x3d, 0xe4, 0xa6, 0xb3, 0x71, 0x43, 0x77, 0xf3, 0xc4, 0xa2, 0x71, 0x20 };
    NSString * expectedValue = @"C9B0F3FB8878287E3DE4A6B3714377F3C4A27120";
    
    NSData * testData = [[NSData alloc] initWithBytes:testBytes length:20];
    
    NSString * hexDataString = [testData cr_hexadecimalStringValue];
    
    STAssertEqualObjects(expectedValue, hexDataString, @"String output should be data in hexadecimal format (capitalized)");
}

- (void) testRandomDataIsSeeminglyRandom
{
    NSData * testData1 = [NSData cr_randomDataOfLength:20];
    NSData * testData2 = [NSData cr_randomDataOfLength:20];
    
    STAssertFalse([testData1 isEqualToData:testData2], @"Two randomly-generated bits of data should not be equal");
}

- (void) testRandomDataHasCorrectLength
{
    NSData * testData = [NSData cr_randomDataOfLength:20];
    STAssertEquals([testData length], 20U, @"Randomly generated data should be twenty bytes long for this test");
}

- (void) testSHA1HashValueHashesDataCorrectly
{
    NSString * testString = @"this is a test string to be hashed";
    
    // c9b0f3fb8878287e3de4a6b3714377f3c4a27120
    uint8_t expectedData[] = { 0xc9, 0xb0, 0xf3, 0xfb, 0x88, 0x78, 0x28, 0x7e,
        0x3d, 0xe4, 0xa6, 0xb3, 0x71, 0x43, 0x77, 0xf3, 0xc4, 0xa2, 0x71, 0x20 };
    
    NSData * expectedObjCData = [[NSData alloc] initWithBytes:expectedData length:20];
    NSData * testStringData = [testString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData * shaSum = [testStringData cr_sha1HashValue];
    
    STAssertEqualObjects(expectedObjCData, shaSum, @"SHA-1 has should match precomputed value");
}

@end
