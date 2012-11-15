//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import <Foundation/Foundation.h>

@interface CRDataReader : NSObject
{
}

@property (nonatomic, readonly) NSUInteger position;
@property (nonatomic, copy, readonly) NSData * data;

- (id) initWithData:(NSData *)data;

- (BOOL) canReadLength:(NSUInteger)length;

- (uint8_t) readUInt8;
- (int8_t) readInt8;
- (int16_t) readInt16;
- (uint16_t) readUInt16;
- (uint32_t) readUInt32;
- (int32_t) readInt32;
- (uint64_t) readUInt64;
- (int64_t) readInt64;
- (NSData *) readDataOfLength:(NSUInteger)length;

- (NSData *) remainingData;

@end
