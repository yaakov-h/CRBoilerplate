#import <Foundation/Foundation.h>

@interface NSUserDefaults (CRBoilerplate)

- (void) cr_registerDefaultsFromBundlePlist:(NSString *)plistFileName;

@end
