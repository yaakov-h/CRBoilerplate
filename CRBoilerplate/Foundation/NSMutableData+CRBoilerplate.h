#import <Foundation/Foundation.h>

@interface NSMutableData (CRBoilerplate)

- (void) cr_appendInt16:(int16_t)value;
- (void) cr_appendInt32:(int32_t)value;
- (void) cr_appendInt64:(int64_t)value;

- (void) cr_appendUInt8:(uint8_t)value;
- (void) cr_appendUInt16:(uint16_t)value;
- (void) cr_appendUInt32:(uint32_t)value;
- (void) cr_appendUInt64:(uint64_t)value;

- (void) cr_appendUInt16:(uint16_t)value reversed:(BOOL)reversed;
- (void) cr_appendUInt32:(uint32_t)value reversed:(BOOL)reversed;
- (void) cr_appendUInt64:(uint64_t)value reversed:(BOOL)reversed;

@end
