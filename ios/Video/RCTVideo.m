#import "RCTVideo.h"
#import <react_native_video/react_native_video-Swift.h>


@implementation RCTVideo {
    NSDictionary* _drm;
}

- (void)setDrm:(NSDictionary *)drm {
  _drm = drm;
}

- (void)playerItemForSource:(NSDictionary *)source withCallback:(void(^)(AVPlayerItem *))handler
{
    NSDictionary *drm = self->_drm;
    if (drm != nil) {
        NSString *vualtoToken = (NSString *)[drm objectForKey:@"vualtoToken"];
        NSString *contentdId = (NSString *)[drm objectForKey:@"contentdId"];
        if (vualtoToken != nil) {
            NSString *uri = [source objectForKey:@"uri"];
            VualtoManager *vualtoManager = [[VualtoManager alloc] init];
            AVPlayerItem *pi = [vualtoManager getVualtoPlayerItemWithAssetURL:uri token:vualtoToken contentID:contentdId];
            handler(pi);
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
