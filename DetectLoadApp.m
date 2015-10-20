//hook UIKit to load all
//Check app and load code 
//Example load mediaserverd

BOOL is_hook(NSString* name){
	NSArray *args = [[NSClassFromString(@"NSProcessInfo") processInfo] arguments];
	NSUInteger count = args.count;
	if (count != 0) {
		NSString *executablePath = args[0];
		return [[executablePath lastPathComponent] isEqualToString:name];
	}
	return NO;
}
%ctor{
	if (is_hook(@"Viber")) {
	  //Do some thing with Viber :D
	}
}
