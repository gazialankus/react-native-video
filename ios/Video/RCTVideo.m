#import "RCTVideo.h"
#import <react-native-video/VualtoManager-Swift.h>

@implementation RCTVideo {
    NSDictionary *_drm;
}

- (void)playerItemForSource:(NSDictionary *)source withCallback:(void(^)(AVPlayerItem *))handler
{
    NSLog(@"hello from the other side");
    if (self->_drm != nil) {
        NSString *vualtoToken = (NSString *)[self->_drm objectForKey:@"vualtoToken"];
        if (vualtoToken != nil) {
            // TODO :
            VualtoManager *vualtoManager = [[VualtoManager alloc] init];
            [vualtoManager ]
            return;
        }
    }
    [super playerItemForSource:source withCallback:handler];
}

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher
{
    return [super initWithEventDispatcher:eventDispatcher];
}
@end
