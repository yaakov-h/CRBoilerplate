#import "NSUserDefaults+CRBoilerplate.h"

@implementation NSUserDefaults (CRBoilerplate)

- (void) cr_registerDefaultsFromBundlePlist:(NSString *)plistFileName
{
	NSString * filePath = [[NSBundle mainBundle] pathForResource:plistFileName ofType:@"plist"];
	NSDictionary * defaults = [NSDictionary dictionaryWithContentsOfFile:filePath];
	
	[self registerDefaults:defaults];
}

@end
