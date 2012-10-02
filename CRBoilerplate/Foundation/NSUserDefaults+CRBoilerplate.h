#import <Foundation/Foundation.h>

@interface NSUserDefaults (CRBoilerplate)

- (void) cr_registerDefaultsFromBundlePlistWithName:(NSString *)plistFileName;

@end
