//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import <SenTestingKit/SenTestingKit.h>
#import "CRDataReader.h"

@interface CRDataReaderTests : SenTestCase

@end

@implementation CRDataReaderTests
{
    NSData * testData;
    CRDataReader * reader;
}

- (void) setUp
{
    uint8_t bytes[] = {0xFF, 0xF0, 0x51, 0xF3, 0x48, 0x5B, 0x7E, 0xFA};
    testData = [NSData dataWithBytes:bytes length:8];
    reader = [[CRDataReader alloc] initWithData:testData];
}

- (void) tearDown
{
    testData = nil;
    reader = nil;
}


- (void) testReadInt8
{
    int8_t testInt = [reader readInt8];
    int8_t expectedInt = -1;
    STAssertEquals(expectedInt, testInt, @"Read integer should match expected integer");
}

- (void) testReadUInt8
{
    uint8_t testInt = [reader readUInt8];
    uint8_t expectedInt = 255;
    STAssertEquals(expectedInt, testInt, @"Read integer should match expected integer");
}

- (void) testReadInt16
{
    int16_t testInt = [reader readInt16];
    int16_t expectedInt = -3841;
    STAssertEquals(expectedInt, testInt, @"Read integer should match expected integer");
}

- (void) testReadUInt16
{
    uint16_t testInt = [reader readUInt16];
    uint16_t expectedInt = 61695;
    STAssertEquals(expectedInt, testInt, @"Read integer should match expected integer");
}

- (void) testReadInt32
{
    int32_t testInt = [reader readInt32];
    int32_t expectedInt = -212733697;
    STAssertEquals(expectedInt, testInt, @"Read integer should match expected integer");
}

- (void) testReadUInt32
{
    uint32_t testInt = [reader readUInt32];
    uint32_t expectedInt = 4082233599;
    STAssertEquals(expectedInt, testInt, @"Read integer should match expected integer");
}

- (void) testReadInt64
{
    int64_t testInt = [reader readInt64];
    int64_t expectedInt = -396779348284018433;
    STAssertEquals(expectedInt, testInt, @"Read integer should match expected integer");
}

- (void) testReadUInt64
{
    uint64_t testInt = [reader readUInt64];
    uint64_t expectedInt = 18049964725425533183U;
    STAssertEquals(expectedInt, testInt, @"Read integer should match expected integer");
}

- (void) testMaintainsPositionBetweenReads
{
    uint8_t firstInt = [reader readUInt8];
    uint8_t secondInt = [reader readUInt8];
    
    STAssertEquals(firstInt, (uint8_t)0xFF, @"First integer read should be that of position 0");
    STAssertEquals(secondInt, (uint8_t)0xF0, @"Second integer read should be that of position 1");
}

- (void) testReadDataOfLengthReadsDataOfGivenLength
{
    NSData * data = [reader readDataOfLength:4];
    
    STAssertEquals([data length], 4U, @"Should have read 4 bytes");
}

- (void) testRemaingDataReturnsRemainingData
{
    [reader readUInt8];
    NSData * data = [reader remainingData];
    
    STAssertEquals([data length], 7U, @"Should have read 7 remaining bytes");
}

- (void) testRemainingDataDoesNotMutatePositionMarker
{
    uint8_t firstInt = [reader readUInt8];
    NSData * data = [reader remainingData];
    uint8_t secondInt = [reader readUInt8];
    
    STAssertEquals(firstInt, (uint8_t)0xFF, @"First integer read should be that of position 0");
    STAssertEquals(secondInt, (uint8_t)0xF0, @"Second integer read should be that of position 1");
    STAssertEquals([data length], 7U, @"Should have read 7 remaining bytes");
}

- (void) testReaderCopiesData
{
    NSMutableData * data = [NSMutableData data];
    CRDataReader * testReader = [[CRDataReader alloc] initWithData:data];
    
    STAssertEquals([[testReader remainingData] length], 0U, @"Should have no data");
    
    int dataToAppend = -62;
    [data appendData:[NSData dataWithBytes:&dataToAppend length:sizeof(int)]];
    
    STAssertEquals([[testReader remainingData] length], 0U, @"Should still have no data");
}

@end
