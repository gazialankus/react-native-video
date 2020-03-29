package com.brentvatne.exoplayer;

import com.google.android.exoplayer2.ext.mediasession.MediaSessionConnector;
import com.vualto.vudrm.widevine.AssetConfiguration;
import com.vualto.vudrm.widevine.WidevineCallback;
import com.vualto.vudrm.widevine.vudrm;
import com.vualto.vudrm.HttpKidSource;


@SuppressLint("ViewConstructor")
@SuppressWarnings("unchecked")
class ReactExoplayerView extends ReactExoplayerViewBase {

    @Override
    protected DrmSessionManager<FrameworkMediaCrypto> buildDrmSessionManager(UUID uuid,
                                                                           String licenseUrl, String[] keyRequestPropertiesArray, String vualtoToken, Uri srcUri) throws UnsupportedDrmException, MalformedURLException, InvalidObjectException {
        if (Util.SDK_INT < 18) {
            return null;
        }
        if (vualtoToken != null) {
            AssetConfiguration assetConfiguration = new AssetConfiguration.Builder()
                    .tokenWith(vualtoToken)
                    .kidProviderWith(new HttpKidSource(new URL(srcUri.toString())))
                    .build();

            WidevineCallback callback = new WidevineCallback(assetConfiguration);
            return new DefaultDrmSessionManager<>(vudrm.widevineDRMSchemeUUID,
                    FrameworkMediaDrm.newInstance(vudrm.widevineDRMSchemeUUID),
                    callback,
                    null,
                    false,
                    0);

        } else {
            HttpMediaDrmCallback drmCallback = new HttpMediaDrmCallback(licenseUrl,
                    buildHttpDataSourceFactory(false));
            if (keyRequestPropertiesArray != null) {
                for (int i = 0; i < keyRequestPropertiesArray.length - 1; i += 2) {
                    drmCallback.setKeyRequestProperty(keyRequestPropertiesArray[i],
                            keyRequestPropertiesArray[i + 1]);
                }
            }

            return new DefaultDrmSessionManager<>(uuid,
                    FrameworkMediaDrm.newInstance(uuid),
                    drmCallback,
                    null,
                    false,
                    3);
        }
    }
}
