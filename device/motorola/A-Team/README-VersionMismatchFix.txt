
# Manual Patch Instructions For System/Vendor Mismatch Error #


-Go Here: frameworks/base/core/java/android/os

-Delete This: Build.java.rej

-Delete This: Build.java

-Rename This: Build.java.original --> Build.java

-Open This With Text Editor: Build.java

-Find This Code:


    public static boolean isBuildConsistent() {
        // Don't care on eng builds.  Incremental build may trigger false negative.
        /*if (IS_ENG) return true;

        if (IS_TREBLE_ENABLED) {
            int result = VintfObject.verifyBuildAtBoot();

            if (result != 0) {
                Slog.e(TAG, "Vendor interface is incompatible, error="
                        + String.valueOf(result));
            }

            return result == 0;
            return true;
        }

        final String system = SystemProperties.get("ro.system.build.fingerprint");
        final String vendor = SystemProperties.get("ro.vendor.build.fingerprint");
        final String bootimage = SystemProperties.get("ro.bootimage.build.fingerprint");
        final String requiredBootloader = SystemProperties.get("ro.build.expect.bootloader");
        final String currentBootloader = SystemProperties.get("ro.bootloader");
        final String requiredRadio = SystemProperties.get("ro.build.expect.baseband");
        final String currentRadio = joinListOrElse(
                TelephonyProperties.baseband_version(), "");

        if (TextUtils.isEmpty(system)) {
            Slog.e(TAG, "Required ro.system.build.fingerprint is empty!");
            return false;
        }

        if (!TextUtils.isEmpty(vendor)) {
            if (!Objects.equals(system, vendor)) {
                Slog.e(TAG, "Mismatched fingerprints; system reported " + system
                        + " but vendor reported " + vendor);
                return false;
            }
        } */

        /* TODO: Figure out issue with checks failing
        if (!TextUtils.isEmpty(bootimage)) {
            if (!Objects.equals(system, bootimage)) {
                Slog.e(TAG, "Mismatched fingerprints; system reported " + system
                        + " but bootimage reported " + bootimage);
                return false;
            }
        }

        if (!TextUtils.isEmpty(requiredBootloader)) {
            if (!Objects.equals(currentBootloader, requiredBootloader)) {
                Slog.e(TAG, "Mismatched bootloader version: build requires " + requiredBootloader
                        + " but runtime reports " + currentBootloader);
                return false;
            }
        }

        if (!TextUtils.isEmpty(requiredRadio)) {
            if (!Objects.equals(currentRadio, requiredRadio)) {
                Slog.e(TAG, "Mismatched radio version: build requires " + requiredRadio
                        + " but runtime reports " + currentRadio);
                return false;
            }
        }
        */

        return true;
    }


-Make That Function Into This:


    public static boolean isBuildConsistent() {
        return true;
    }


-Save Build.java And You're Done.




