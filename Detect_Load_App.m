//hook UIKit to load all
//Check app and load code 

//Example load mediaserverd

BOOL is_mediaserverd()
{
	NSArray *args = [[NSClassFromString(@"NSProcessInfo") processInfo] arguments];
	NSUInteger count = args.count;
	if (count != 0) {
		NSString *executablePath = args[0];
		return [[executablePath lastPathComponent] isEqualToString:@"mediaserverd"];
	}
	return NO;
}
%ctor
{
	if (!is_mediaserverd()) {
	  //Do some thing
	}
}
