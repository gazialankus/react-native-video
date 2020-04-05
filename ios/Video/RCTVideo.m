#import "RCTVideo.h"

@implementation RCTVideo

- (void)playerItemForSource:(NSDictionary *)source withCallback:(void(^)(AVPlayerItem *))handler
{
    NSLog(@"hello from the other side");
    [super playerItemForSource:source withCallback:handler];
}

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher
{
    return [super initWithEventDispatcher:eventDispatcher];
}
@end
