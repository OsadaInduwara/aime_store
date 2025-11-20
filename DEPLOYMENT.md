# Deployment Guide

## 🚀 **Complete Deployment Guide for Aime Store**

This guide will walk you through deploying your app to production.

---

## 📋 **Pre-Deployment Checklist**

### Code Quality
- [ ] All tests passing (`flutter test`)
- [ ] No lint errors (`flutter analyze`)
- [ ] Code reviewed and approved
- [ ] All features working as expected

### Security
- [ ] Firestore rules deployed
- [ ] Storage rules deployed
- [ ] API keys secured
- [ ] Environment variables configured
- [ ] Firebase App Check enabled

### Configuration
- [ ] Production Firebase project set up
- [ ] PayHere production keys configured
- [ ] App icons and splash screen added
- [ ] Privacy policy created
- [ ] Terms of service created

---

## 🔧 **Environment Setup**

### 1. Create Production Environment File
Create `.env.production`:
```env
# PayHere Production
PAYHERE_MERCHANT_ID=your_production_merchant_id
PAYHERE_MERCHANT_SECRET=your_production_secret
PAYHERE_SANDBOX=false

# Firebase (if using environment-based config)
FIREBASE_PROJECT_ID=your_production_project_id
```

### 2. Update Firebase Configuration
```bash
# Switch to production Firebase project
firebase use production

# Deploy security rules
firebase deploy --only firestore:rules,storage:rules
```

---

## 📱 **Android Deployment**

### 1. Update App Configuration
Edit `android/app/build.gradle`:
```gradle
android {
    defaultConfig {
        applicationId "lk.aime.store"
        minSdkVersion 21
        targetSdkVersion 34
        versionCode 1
        versionName "1.0.0"
    }
}
```

### 2. Create Keystore
```bash
keytool -genkey -v -keystore ~/aime-store-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias aime-store
```

### 3. Configure Signing
Create `android/key.properties`:
```properties
storePassword=your_store_password
keyPassword=your_key_password
keyAlias=aime-store
storeFile=/path/to/aime-store-key.jks
```

Update `android/app/build.gradle`:
```gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

android {
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```

### 4. Build Release
```bash
# Build APK
flutter build apk --release

# Build App Bundle (recommended)
flutter build appbundle --release
```

### 5. Upload to Google Play
1. Go to [Google Play Console](https://play.google.com/console)
2. Create new app
3. Fill in app details
4. Upload `build/app/outputs/bundle/release/app-release.aab`
5. Complete store listing
6. Submit for review

---

## 🍎 **iOS Deployment**

### 1. Update App Configuration
Edit `ios/Runner/Info.plist`:
```xml
<key>CFBundleDisplayName</key>
<string>Aime Store</string>
<key>CFBundleIdentifier</key>
<string>lk.aime.store</string>
<key>CFBundleVersion</key>
<string>1</string>
<key>CFBundleShortVersionString</key>
<string>1.0.0</string>
```

### 2. Configure Signing
1. Open `ios/Runner.xcworkspace` in Xcode
2. Select Runner target
3. Go to Signing & Capabilities
4. Select your team
5. Configure provisioning profile

### 3. Build Release
```bash
flutter build ios --release
```

### 4. Upload to App Store
1. Open Xcode
2. Product → Archive
3. Distribute App
4. Upload to App Store Connect
5. Complete app information
6. Submit for review

---

## 🔥 **Firebase Setup**

### 1. Enable Required Services
```bash
# Enable Firestore
firebase firestore:enable

# Enable Storage
firebase storage:enable

# Enable Authentication
firebase auth:enable

# Enable Cloud Messaging
firebase messaging:enable
```

### 2. Deploy Security Rules
```bash
firebase deploy --only firestore:rules,storage:rules
```

### 3. Enable App Check
1. Go to Firebase Console
2. Navigate to App Check
3. Register your app
4. Enable enforcement

---

## 📊 **Monitoring Setup**

### 1. Enable Crashlytics
Already configured in the app. Crashes will be reported automatically.

### 2. Enable Analytics
Already configured. Events are tracked automatically.

### 3. Set Up Alerts
1. Go to Firebase Console
2. Navigate to Alerts
3. Set up alerts for:
   - High crash rate
   - Performance issues
   - Security rule violations

---

## 🧪 **Testing Before Launch**

### 1. Beta Testing
Use Firebase App Distribution:
```bash
firebase appdistribution:distribute build/app/outputs/apk/release/app-release.apk \
  --app YOUR_APP_ID \
  --groups testers
```

### 2. Test Checklist
- [ ] Authentication flows
- [ ] Payment processing
- [ ] Order placement
- [ ] Push notifications
- [ ] Search functionality
- [ ] Image loading
- [ ] Offline behavior

---

## 🚀 **Launch Strategy**

### 1. Soft Launch
- Release to 10% of users
- Monitor for 48 hours
- Fix critical issues

### 2. Gradual Rollout
- Increase to 25% after 2 days
- Increase to 50% after 1 week
- Full rollout after 2 weeks

### 3. Monitor Metrics
- Crash-free rate (target: >99%)
- User retention
- Payment success rate
- App performance

---

## 📱 **Post-Launch**

### 1. Monitor Daily
- Crash reports
- User reviews
- Analytics data
- Performance metrics

### 2. Respond to Issues
- Fix critical bugs within 24h
- Respond to reviews
- Update app regularly

### 3. Iterate
- Collect user feedback
- Add requested features
- Improve performance
- Optimize UX

---

## 🔄 **Update Process**

### 1. Version Bump
Update version in `pubspec.yaml`:
```yaml
version: 1.1.0+2
```

### 2. Build & Test
```bash
flutter test
flutter build appbundle --release
```

### 3. Deploy
Upload to stores and monitor rollout.

---

## 📞 **Support**

### Emergency Contacts
- Firebase Support: [Firebase Console](https://console.firebase.google.com)
- Google Play Support: [Play Console](https://play.google.com/console)
- Apple Support: [App Store Connect](https://appstoreconnect.apple.com)

---

**Your app is ready for production!** 🎉
