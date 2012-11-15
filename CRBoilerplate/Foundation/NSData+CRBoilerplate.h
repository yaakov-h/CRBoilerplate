//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import <Foundation/Foundation.h>

@interface NSData (CRBoilerplate)

- (NSString *) cr_hexadecimalStringValue;
+ (NSData *) cr_randomDataOfLength:(NSUInteger)length;
- (NSData *) cr_sha1HashValue;
- (uint32_t) cr_jenkinsHash;
- (uint32_t) cr_CRC32Hash;

@end
