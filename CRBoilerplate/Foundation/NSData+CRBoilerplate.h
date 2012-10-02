#import <Foundation/Foundation.h>

@interface NSData (CRBoilerplate)

- (NSString *) cr_hexadecimalStringValue;
+ (NSData *) cr_randomDataOfLength:(NSUInteger)length;
- (NSData *) cr_sha1HashValue;

@end
