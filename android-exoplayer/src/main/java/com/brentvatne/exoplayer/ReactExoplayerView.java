package com.brentvatne.exoplayer;


class ReactExoplayerView extends ReactExoplayerViewBase {

    @Override
    protected DrmSessionManager<FrameworkMediaCrypto> buildDrmSessionManager(
                UUID uuid,
                String licenseUrl,
                String[] keyRequestPropertiesArray,
                String vualtoToken,
                Uri srcUri)
            throws UnsupportedDrmException,
                MalformedURLException,
                InvalidObjectException {

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
