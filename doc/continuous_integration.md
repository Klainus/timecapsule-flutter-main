## CI/CD 🏎️

### Continuous Integration and Distribution with Codemagic: A Step-by-Step Guide

#### Prerequisites:
1. **Codemagic Setup**: This guide uses Codemagic for continuous integration and distribution. Begin by updating the provided `codemagic.yml` boilerplate with your application's specific details.

2. **Access Requirements**: Ensure you have access to both the *Google Play Store* and *App Store Connect*. Your application should already exist in these platforms, as you'll need to generate *provisioning profiles*, *certificates*, and an Android *keystore*.

3. **App Store Connect App ID**: Be aware of your application's *App Store Connect App ID* (not bundle id), necessary for the iOS workflow.

4. **Internal Test Groups**: If you're setting up internal test groups, have their names ready for the iOS beta distribution.

5. **Initial Version Upload**: Upload at least one version of your application to Google Play and TestFlight manually to enable the incrementing of build numbers.

#### Configuration Steps:

1. **Add Your App to Codemagic**: Connect your repository via Codemagic's web interface at [codemagic.io/apps](https://codemagic.io/apps).

2. **Apple Developer Portal Team Integration**:
    - Follow the steps [here](https://docs.codemagic.io/flutter-code-signing/ios-code-signing/#step-1-creating-an-app-store-api-key-for-codemagic) to create an App Store API key.
    - Add this key and its details to both 1Password and Codemagic under `General Settings > Team integrations`.

3. **Configure GCLOUD_SERVICE_ACCOUNT_CREDENTIALS**:
    - Assign this variable to a group (e.g., "google_play").
    - The variable should contain the JSON credentials of a service account authorized to manage your Google Play.
    - More information can be found [here](https://docs.codemagic.io/yaml-publishing/google-play/#configure-google-play-api-access).

4. **Generate an Apple Production Distribution Certificate**: Obtain this from [Apple's Developer portal](https://developer.apple.com/account/resources/certificates/list).

5. **Import Your Certificate**:
    - Use the 'Fetch certificates' option under `Codesigning Identities > Certificates` tab.
    - Select the integration key you previously uploaded.

6. **Generate an iOS Distribution Provisioning Profile**: Create this profile on [Apple's Developer portal](https://developer.apple.com/account/resources/profiles/list).

7. **Import Your Provisioning Profile**:
    - Use the 'Fetch profiles' option under `Codesigning Identities > Profiles` tab.
    - Select the integration key you uploaded earlier.

8. **Upload Your Android Keystore**: Do this under `Codesigning Identities > Android keystores`.

9. **Configure `codemagic.yml`**:
    - Read the inline comments within `codemagic.yml`.
    - Adjust the settings to align with your application's requirements.

10. **Trigger a Build**: Initiate a build to test your configuration.

