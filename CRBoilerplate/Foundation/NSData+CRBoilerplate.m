//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import "NSData+CRBoilerplate.h"
#import <CommonCrypto/CommonCrypto.h>
#import "lookup2.h"
#import "crc32.h"

@implementation NSData (CRBoilerplate)

- (NSString *) cr_hexadecimalStringValue
{
    static const char hexDigits[] = "0123456789ABCDEF";
    const size_t numBytes = [self length];
    const unsigned char * bytes = [self bytes];
	
    char * stringBuffer = (char *)malloc(numBytes * 2 + 1);
    char * hex = stringBuffer;
	
    for (int i = 0; i < numBytes; i++)
    {
        const unsigned char c = *bytes++;
        *hex++ = hexDigits[(c >> 4) & 0xF];
        *hex++ = hexDigits[(c & 0xF)];
    }
    *hex = 0;
    
    NSString * hexString = [NSString stringWithUTF8String:stringBuffer];
    free(stringBuffer);
    return hexString;
}

+ (NSData *) cr_randomDataOfLength:(NSUInteger) length
{
	NSMutableData * data = [[NSMutableData alloc] initWithCapacity:length];
	for (NSUInteger i = 0; i < length; i++)
    {
		uint8_t ran = arc4random() & 0xFF;
		[data appendBytes:&ran length:sizeof(uint8_t)];
	}
	
    return [data copy];
}

- (NSData *) cr_sha1HashValue
{
    NSMutableData * mutableData = [NSMutableData dataWithLength:CC_SHA1_DIGEST_LENGTH];
    
    if (!CC_SHA1([self bytes], [self length], [mutableData mutableBytes]))
    {
        return nil;
    }
    
    return [mutableData copy];
}

- (uint32_t) cr_jenkinsHash {
	return hash((unsigned char *)[self bytes], [self length], 0);
}

- (uint32_t) cr_CRC32Hash {
	crc_t crc = crc_init();
	crc = crc_update(crc, (const unsigned char *)[self bytes], [self length]);
	return crc_finalize(crc);
}

@end
