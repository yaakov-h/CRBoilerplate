//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import "NSMutableData+CRBoilerplate.h"

@implementation NSMutableData (CRBoilerplate)

- (void) cr_appendInt16:(int16_t)value
{
	[self appendBytes:&value length:sizeof(int16_t)];
}

- (void) cr_appendInt32:(int32_t)value
{
	[self appendBytes:&value length:sizeof(int32_t)];
}

- (void) cr_appendInt64:(int64_t)value
{
	[self appendBytes:&value length:sizeof(int64_t)];
}

- (void) cr_appendUInt8:(uint8_t)value
{
	[self appendBytes:&value length:sizeof(uint8_t)];
}

- (void) cr_appendUInt16:(uint16_t)value
{
	[self cr_appendUInt16:value reversed:NO];
}

- (void) cr_appendUInt32:(uint32_t)value
{
	[self cr_appendUInt32:value reversed:NO];
}

- (void) cr_appendUInt64:(uint64_t)value
{
	[self cr_appendUInt64:value reversed:NO];
}

- (void) cr_appendUInt16:(uint16_t)value reversed:(BOOL)reversed
{
	if (reversed)
    {
        value = htons(value);
    }
    
	[self appendBytes:&value length:sizeof(uint16_t)];
}

- (void) cr_appendUInt32:(uint32_t)value reversed:(BOOL)reversed
{
	if (reversed)
    {
        value = htonl(value);
    }
    
	[self appendBytes:&value length:sizeof(uint32_t)];
}

- (void) cr_appendUInt64: (uint64_t)value reversed:(BOOL)reversed
{
	if (reversed)
    {
        value = CFSwapInt64(value);
    }
	
	[self appendBytes:&value length:sizeof(uint64_t)];
}

@end
