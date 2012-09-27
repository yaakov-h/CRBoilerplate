#import "NSData+CRBoilerplate.h"

@implementation NSData (CRBoilerplate)

- (NSString *) cr_hexadecimalStringValue
{
    static const char hexDigits[] = "0123456789ABCDEF";
    const size_t numBytes = [self length];
    const unsigned char * bytes = [self bytes];
	
    char * stringBuffer = (char *)malloc(numBytes * 2 + 1);
    char * hex = stringBuffer;
	
    for (int i = 0; i < numBytes; i++) {
        const unsigned char c = *bytes++;
        *hex++ = hexDigits[(c >> 4) & 0xF];
        *hex++ = hexDigits[(c & 0xF)];
    }
    *hex = 0;
    
    NSString * hexString = [NSString stringWithUTF8String:stringBuffer];
    free(stringBuffer);
    return hexString;
}

@end
