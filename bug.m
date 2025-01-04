In Objective-C, a tricky bug can arise from the interaction between KVO (Key-Value Observing) and memory management, specifically when an observed object is deallocated.  If an observer is not properly removed before the observed object is deallocated, it can lead to crashes or unexpected behavior. This often manifests as EXC_BAD_ACCESS exceptions.  Consider this scenario:

```objectivec
@interface MyClass : NSObject
@property (nonatomic, strong) NSString *myString;
@end

@implementation MyClass
- (void)dealloc {
    NSLog(@