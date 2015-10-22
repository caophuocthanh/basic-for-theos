
#import <objc/runtime.h>

static IMP original_didReceiveLocalNotification;
void replaced_didReceiveLocalNotification(id self, SEL _cmd, id application, id event){
    NSLog(@"%@ ABCAKGDJKAGKDA:  %@", application, event);
    original_didReceiveLocalNotification(self, _cmd, application, event);
}

%ctor{
	int numClasses = objc_getClassList(NULL, 0);
	Class* list = (Class*)malloc(sizeof(Class) * numClasses);
	objc_getClassList(list, numClasses);   
	NSLog(@"numClasses:%d",numClasses);
	for (int i = 0; i < numClasses; i++){
		NSLog(@"ABC: [%d] %@",i,list[i]);
    	if (class_conformsToProtocol(list[i], @protocol(UIApplicationDelegate)) && 
        	class_getInstanceMethod(list[i], @selector(application:didReceiveLocalNotification:))){
        	NSLog(@"XYZ: %@",list[i]);
        	MSHookMessageEx(list[i], @selector(application:didReceiveLocalNotification:), (IMP)replaced_didReceiveLocalNotification, (IMP*)&original_didReceiveLocalNotification);
   	 	}
   	 	
	}
	free(list);
}
