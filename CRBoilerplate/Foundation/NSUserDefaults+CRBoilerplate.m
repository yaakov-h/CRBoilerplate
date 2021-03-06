//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

#import "NSUserDefaults+CRBoilerplate.h"

@implementation NSUserDefaults (CRBoilerplate)

- (void) cr_registerDefaultsFromBundlePlistWithName:(NSString *)plistFileName
{
	NSString * filePath = [[NSBundle mainBundle] pathForResource:plistFileName ofType:@"plist"];
	NSDictionary * defaults = [NSDictionary dictionaryWithContentsOfFile:filePath];
	
	[self registerDefaults:defaults];
}

@end
