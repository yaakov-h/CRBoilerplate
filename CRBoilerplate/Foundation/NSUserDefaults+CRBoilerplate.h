//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (CRBoilerplate)

- (void) cr_registerDefaultsFromBundlePlistWithName:(NSString *)plistFileName;

@end
