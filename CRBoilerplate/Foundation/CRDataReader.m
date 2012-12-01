//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import "CRDataReader.h"
#import "NSMutableData+CRBoilerplate.h"

@implementation CRDataReader

- (id) initWithData:(NSData *)data
{
	self = [super init];
	if (self) {
		_data = [data copy];
		_position = 0;
	}
	return self;
}

- (void) dealloc
{
	_data = nil;
}

- (BOOL) canReadLength:(NSUInteger)length
{
	return ((_position + length) <= [_data length]);
}

- (uint8_t) readUInt8
{
	uint8_t * byte = (uint8_t *)[[_data subdataWithRange:NSMakeRange(_position, sizeof(uint8_t))] bytes];
	_position += sizeof(uint8_t);
	return *byte;
}

- (int8_t) readInt8
{
	int8_t * byte = (int8_t *)[[_data subdataWithRange:NSMakeRange(_position, sizeof(int8_t))] bytes];
	_position += sizeof(int8_t);
	return *byte;
}

- (uint16_t) readUInt16
{
	uint16_t * bytes = (uint16_t *)[[_data subdataWithRange:NSMakeRange(_position, sizeof(uint16_t))] bytes];
	_position += sizeof(uint16_t);
	return *bytes;
}

- (int16_t) readInt16
{
	int16_t * bytes = (int16_t *)[[_data subdataWithRange:NSMakeRange(_position, sizeof(int16_t))] bytes];
	_position += sizeof(int16_t);
	return *bytes;
}

- (uint32_t) readUInt32
{
	uint32_t * bytes = (uint32_t *)[[_data subdataWithRange:NSMakeRange(_position, sizeof(uint32_t))] bytes];
	_position += sizeof(uint32_t);
	return *bytes;
}

- (int32_t) readInt32
{
	int32_t * bytes = (int32_t *)[[_data subdataWithRange:NSMakeRange(_position, sizeof(int32_t))] bytes];
	_position += sizeof(int32_t);
	return *bytes;
}

- (uint64_t) readUInt64
{
	uint64_t * bytes = (uint64_t *)[[_data subdataWithRange:NSMakeRange(_position, sizeof(uint64_t))] bytes];
	_position += sizeof(uint64_t);
	return *bytes;
}

- (int64_t) readInt64
{
	int64_t * bytes = (int64_t *)[[_data subdataWithRange:NSMakeRange(_position, sizeof(int64_t))] bytes];
	_position += sizeof(int64_t);
	return *bytes;
}

- (NSData *) readDataOfLength:(NSUInteger)length
{
	NSData * retVal = [_data subdataWithRange:NSMakeRange(_position, length)];
	_position += length;
	return retVal;
}

- (NSData *) remainingData
{
	NSUInteger curPosition = _position;
	NSData * remainingData = [self readDataOfLength:([_data length] - _position)];
	_position = curPosition;
	
	return remainingData;
}

- (NSString *) readUTF8String
{
	NSMutableData * stringData = [[NSMutableData alloc] init];
	uint8_t nextByte;
	do
	{
		nextByte  = [self readUInt8];
		if (nextByte != 0)
		{
			[stringData cr_appendUInt8:nextByte];
		}
	} while (nextByte != 0);
	
	return [[NSString alloc] initWithData:stringData encoding:NSUTF8StringEncoding];
}


@end
