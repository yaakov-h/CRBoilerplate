//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import <SenTestingKit/SenTestingKit.h>
#import "NSMutableData+CRBoilerplate.h"

@interface NSMutableDataExtensionsTest : SenTestCase

@end

@implementation NSMutableDataExtensionsTest
{
    NSMutableData * _data;
}

- (void) setUp
{
    _data = [[NSMutableData alloc] init];
}

- (void) tearDown
{
    _data = nil;
}

- (void) testAppendInt16
{
    STAssertEquals([_data length], 0U, @"Sanity check - data should be empty");
    
    [_data cr_appendInt16:-12];
    
    STAssertEquals((size_t)[_data length], sizeof(int16_t), @"Data appended should be 2 bytes");
    STAssertEquals(*(int16_t *)[_data bytes], (int16_t)-12, @"Data should match appended data");
}

- (void) testAppendInt32
{
    STAssertEquals([_data length], 0U, @"Sanity check - data should be empty");
    
    [_data cr_appendInt32:48019];
    
    STAssertEquals((size_t)[_data length], sizeof(int32_t), @"Data appended should be 4 bytes");
    STAssertEquals(*(int32_t *)[_data bytes], 48019, @"Data should match appended data");
}

- (void) testAppendInt64
{
    STAssertEquals([_data length], 0U, @"Sanity check - data should be empty");
    
    [_data cr_appendInt64:-17179869184];
    
    STAssertEquals((size_t)[_data length], sizeof(int64_t), @"Data appended should be 8 bytes");
    STAssertEquals(*(int64_t *)[_data bytes], -17179869184, @"Data should match appended data");
}

- (void) testAppendUInt8
{
    STAssertEquals([_data length], 0U, @"Sanity check - data should be empty");
    
    [_data cr_appendUInt8:254];
    
    STAssertEquals((size_t)[_data length], sizeof(uint8_t), @"Data appended should be 1 byte");
    STAssertEquals(*(uint8_t *)[_data bytes], (uint8_t)254, @"Data should match appended data");
}

- (void) testAppendUInt16
{
    STAssertEquals([_data length], 0U, @"Sanity check - data should be empty");
    
    [_data cr_appendUInt16:348];
    
    STAssertEquals((size_t)[_data length], sizeof(uint16_t), @"Data appended should be 2 bytes");
    STAssertEquals(*(uint16_t *)[_data bytes], (uint16_t)348, @"Data should match appended data");
}

- (void) testAppendUInt32
{
    STAssertEquals([_data length], 0U, @"Sanity check - data should be empty");
    
    [_data cr_appendUInt32:48019];
    
    STAssertEquals((size_t)[_data length], sizeof(uint32_t), @"Data appended should be 4 bytes");
    STAssertEquals(*(uint32_t *)[_data bytes], 48019U, @"Data should match appended data");
}

- (void) testAppendUInt64
{
    STAssertEquals([_data length], 0U, @"Sanity check - data should be empty");
    
    [_data cr_appendUInt64:17179869183];
    
    STAssertEquals((size_t)[_data length], sizeof(uint64_t), @"Data appended should be 8 bytes");
    STAssertEquals(*(uint64_t *)[_data bytes], 17179869183U, @"Data should match appended data");
}

- (void) testAppendUInt16Reversed
{
    STAssertEquals([_data length], 0U, @"Sanity check - data should be empty");
    
    [_data cr_appendUInt16:348 reversed:YES];
    
    STAssertEquals((size_t)[_data length], sizeof(uint16_t), @"Data appended should be 2 bytes");
    STAssertEquals(*(uint16_t *)[_data bytes], CFSwapInt16(348), @"Data should match appended data (reversed)");
}

- (void) testAppendUInt32Reversed
{
    STAssertEquals([_data length], 0U, @"Sanity check - data should be empty");
    
    [_data cr_appendUInt32:48019 reversed:YES];
    
    STAssertEquals((size_t)[_data length], sizeof(uint32_t), @"Data appended should be 4 bytes");
    STAssertEquals(*(uint32_t *)[_data bytes], CFSwapInt32(48019), @"Data should match appended data (reversed)");
}

- (void) testAppendUInt64Reversed
{
    STAssertEquals([_data length], 0U, @"Sanity check - data should be empty");
    
    [_data cr_appendUInt64:17179869183 reversed:YES];
    
    STAssertEquals((size_t)[_data length], sizeof(uint64_t), @"Data appended should be 8 bytes");
    STAssertEquals(*(uint64_t *)[_data bytes], CFSwapInt64(17179869183), @"Data should match appended data (reversed)");
}

@end
