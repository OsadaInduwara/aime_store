# Security Configuration Guide

## 🔐 Firebase Security Setup

### 1. Deploy Firestore Security Rules

```bash
# Deploy Firestore rules
firebase deploy --only firestore:rules

# Or deploy all rules at once
firebase deploy --only firestore:rules,storage:rules
```

### 2. Deploy Storage Security Rules

```bash
# Deploy Storage rules
firebase deploy --only storage:rules
```

### 3. Verify Rules Deployment

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project
3. Navigate to **Firestore Database** → **Rules**
4. Verify the rules are deployed
5. Navigate to **Storage** → **Rules**
6. Verify the storage rules are deployed

---

## 🔑 API Keys & Sensitive Data

### Environment Variables

Create a `.env` file in the project root (DO NOT commit to git):

```env
# Firebase Configuration
FIREBASE_API_KEY=your_api_key_here
FIREBASE_APP_ID=your_app_id_here
FIREBASE_MESSAGING_SENDER_ID=your_sender_id_here
FIREBASE_PROJECT_ID=your_project_id_here

# Stripe Configuration
STRIPE_PUBLISHABLE_KEY=your_stripe_publishable_key_here
STRIPE_SECRET_KEY=your_stripe_secret_key_here

# Google Sign-In
GOOGLE_CLIENT_ID=your_google_client_id_here

# Facebook Sign-In
FACEBOOK_APP_ID=your_facebook_app_id_here
```

### Update .gitignore

Ensure these files are in `.gitignore`:

```gitignore
# Environment files
.env
.env.local
.env.production

# Firebase config (if contains sensitive data)
google-services.json
GoogleService-Info.plist

# API keys
**/apikeys.dart
**/secrets.dart
```

### Secure API Keys in Code

Create `lib/core/config/api_keys.dart`:

```dart
// DO NOT commit this file with real keys
class ApiKeys {
  // Use environment variables in production
  static const String stripePublishableKey = String.fromEnvironment(
    'STRIPE_PUBLISHABLE_KEY',
    defaultValue: 'pk_test_...',
  );
  
  static const String googleClientId = String.fromEnvironment(
    'GOOGLE_CLIENT_ID',
    defaultValue: '',
  );
  
  // Add other API keys here
}
```

---

## 🛡️ Security Best Practices

### 1. Authentication

- ✅ Multi-factor authentication enabled
- ✅ Email verification required
- ✅ Strong password requirements (min 6 chars, letters + numbers)
- ✅ Rate limiting on auth attempts
- ✅ Session timeout after inactivity

### 2. Data Validation

- ✅ Client-side validation (ValidationService)
- ✅ Server-side validation (Firestore rules)
- ✅ Input sanitization
- ✅ SQL injection prevention
- ✅ XSS attack prevention

### 3. Network Security

- ✅ HTTPS only
- ✅ Certificate pinning (recommended)
- ✅ Secure WebSocket connections
- ✅ API request signing

### 4. Data Protection

- ✅ Encryption at rest (Firebase default)
- ✅ Encryption in transit (HTTPS)
- ✅ Sensitive data masking
- ✅ PII data protection

---

## 🚨 Security Checklist

### Before Production Launch

- [ ] Deploy Firestore security rules
- [ ] Deploy Storage security rules
- [ ] Remove all test/debug API keys
- [ ] Enable Firebase App Check
- [ ] Set up Firebase Security Rules testing
- [ ] Configure CORS policies
- [ ] Enable rate limiting
- [ ] Set up monitoring and alerts
- [ ] Perform security audit
- [ ] Test all authentication flows
- [ ] Verify data access permissions
- [ ] Check for exposed secrets in code
- [ ] Review third-party dependencies
- [ ] Enable two-factor authentication for admin accounts

---

## 📊 Monitoring & Alerts

### Firebase Console Monitoring

1. **Authentication**
   - Monitor failed login attempts
   - Track unusual activity
   - Set up alerts for suspicious behavior

2. **Firestore**
   - Monitor read/write operations
   - Track rule denials
   - Set up alerts for unusual patterns

3. **Storage**
   - Monitor upload/download activity
   - Track storage usage
   - Set up alerts for large files

### Crashlytics

- Monitor app crashes
- Track error rates
- Set up alerts for critical errors

---

## 🔄 Regular Security Maintenance

### Weekly
- Review authentication logs
- Check for failed rule evaluations
- Monitor API usage

### Monthly
- Update dependencies
- Review security rules
- Audit user permissions
- Check for security vulnerabilities

### Quarterly
- Full security audit
- Penetration testing
- Update security policies
- Review and update API keys

---

## 📞 Security Incident Response

### If Security Breach Detected

1. **Immediate Actions**
   - Disable affected accounts
   - Revoke compromised API keys
   - Block suspicious IP addresses
   - Enable additional logging

2. **Investigation**
   - Review logs
   - Identify breach source
   - Assess damage
   - Document findings

3. **Remediation**
   - Patch vulnerabilities
   - Update security rules
   - Notify affected users
   - Implement additional safeguards

4. **Prevention**
   - Update security policies
   - Enhance monitoring
   - Train team on security
   - Review and improve processes

---

## 📚 Additional Resources

- [Firebase Security Rules Documentation](https://firebase.google.com/docs/rules)
- [OWASP Mobile Security](https://owasp.org/www-project-mobile-security/)
- [Flutter Security Best Practices](https://flutter.dev/docs/deployment/security)
- [Stripe Security](https://stripe.com/docs/security/stripe)
