#import "RCTVideo.h"
#import <react_native_video/react_native_video-Swift.h>

@implementation RCTVideo {
    NSDictionary *_drm;
}

- (void)playerItemForSource:(NSDictionary *)source withCallback:(void(^)(AVPlayerItem *))handler
{
    NSLog(@"hello from the other side");
    
//    [super playerItemForSource:source withCallback:handler];
    if (self->_drm != nil) {
        NSString *vualtoToken = (NSString *)[self->_drm objectForKey:@"vualtoToken"];
        NSString *contentdId = (NSString *)[self->_drm objectForKey:@"vualtoToken"];
        if (vualtoToken != nil) {
            // TODO :
            VualtoManager *vualtoManager = [[VualtoManager alloc] init];
            [super playerItemForSource:source withCallback:^(AVPlayerItem * playerItem) {
                handler();
            }]
            return;
        }
    }
    
}

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher
{
    return [super initWithEventDispatcher:eventDispatcher];
}
@end
