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
        NSString *contentdId = (NSString *)[self->_drm objectForKey:@"contentdId"];
        if (vualtoToken != nil) {
            NSString *uri = [source objectForKey:@"uri"];
            VualtoManager *vualtoManager = [[VualtoManager alloc] init];
            AVPlayerItem *pi = [vualtoManager getVualtoPlayerItemWithAssetURL:uri token:vualtoToken contentID:contentdId];
            [super playerItemForSource:source withCallback:^(AVPlayerItem * playerItem) {
                handler(pi);
            }];
            return;
        }
    }
    
}

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher
{
    return [super initWithEventDispatcher:eventDispatcher];
}
@end
