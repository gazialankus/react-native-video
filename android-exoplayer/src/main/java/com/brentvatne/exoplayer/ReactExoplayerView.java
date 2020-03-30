package com.brentvatne.exoplayer;


import android.net.Uri;

import com.facebook.react.uimanager.ThemedReactContext;
import com.google.android.exoplayer2.drm.DefaultDrmSessionManager;
import com.google.android.exoplayer2.drm.DrmSessionManager;
import com.google.android.exoplayer2.drm.FrameworkMediaCrypto;
import com.google.android.exoplayer2.drm.FrameworkMediaDrm;
import com.google.android.exoplayer2.drm.HttpMediaDrmCallback;
import com.google.android.exoplayer2.drm.UnsupportedDrmException;
import com.google.android.exoplayer2.util.Util;

import java.util.UUID;

class ReactExoplayerView extends ReactExoplayerViewBase {

    public ReactExoplayerView(ThemedReactContext context) {
        super(context);
    }

    @Override
    protected DrmSessionManager<FrameworkMediaCrypto> buildDrmSessionManager(
                UUID uuid,
                String licenseUrl,
                String[] keyRequestPropertiesArray,
                String vualtoToken,
                Uri srcUri)
            throws UnsupportedDrmException {

        if (Util.SDK_INT < 18) {
            return null;
        }

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
