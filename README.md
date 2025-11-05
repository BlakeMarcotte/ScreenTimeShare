# ScreenTime Share

A fun iOS app that allows you to share your screen time and compete with friends in groups.

## Features

- 📊 Track and view your daily screen time
- 👥 Create groups with friends
- 🏆 Compete in daily/weekly/monthly challenges
- 📱 Beautiful SwiftUI interface
- 🔐 Secure authentication with Firebase

## Tech Stack

- **Frontend**: Swift + SwiftUI
- **Backend**: Firebase (Authentication, Firestore)
- **Screen Time**: FamilyControls & DeviceActivity APIs
- **Architecture**: MVVM

## Project Structure

```
ScreenTimeShareXCode/
├── ScreenTimeShareXCodeApp.swift  # App entry point with Firebase config
├── ContentView.swift               # Root view (auth check)
├── Models/                         # Data models
│   ├── User.swift
│   ├── Group.swift
│   └── ScreenTimeData.swift
├── Views/                          # SwiftUI views
│   ├── HomeView.swift              # Main tab navigation
│   ├── LoginView.swift             # Login/signup screen
│   ├── DashboardView.swift         # Screen time dashboard
│   ├── GroupsView.swift            # Groups list
│   ├── GroupDetailView.swift       # Group competition view
│   ├── LeaderboardView.swift       # Global leaderboard
│   └── ProfileView.swift           # User profile & settings
├── ViewModels/                     # Business logic
│   ├── AuthViewModel.swift         # Authentication logic
│   └── ScreenTimeViewModel.swift   # Screen time data logic
├── Services/                       # External integrations
│   ├── FirebaseService.swift       # Firebase operations
│   └── ScreenTimeService.swift     # Screen Time API
├── Info.plist                      # App permissions
└── Assets.xcassets/                # Images and colors
```

## Setup Instructions

### Step 1: Add Files to Xcode Project

All Swift files have been created in the proper folders! Now you need to add them to your Xcode project:

1. Open `ScreenTimeShareXCode.xcodeproj` in Xcode
2. In the Project Navigator (left sidebar), right-click on the `ScreenTimeShareXCode` folder (the blue one)
3. Select **"Add Files to ScreenTimeShareXCode..."**
4. Navigate to `/Users/blakemarcotte/Documents/ScreenTimeShareXcode/ScreenTimeShareXCode/`
5. Select the following folders:
   - `Models/`
   - `Views/`
   - `ViewModels/`
   - `Services/`
   - `Info.plist`
6. Make sure these options are checked:
   - ✅ **"Copy items if needed"** (uncheck this since files are already in the right place)
   - ✅ **"Create groups"** (not "Create folder references")
   - ✅ **Add to targets: ScreenTimeShareXCode**
7. Click **"Add"**

### Step 2: Set Up Firebase

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or use an existing one
3. Click "Add app" → iOS
4. Register your app:
   - **Bundle ID**: Find this in Xcode → Select your project → General tab → Bundle Identifier
   - Download `GoogleService-Info.plist`
5. Add `GoogleService-Info.plist` to your Xcode project:
   - Drag it into the Project Navigator
   - Make sure "Add to targets: ScreenTimeShareXCode" is checked

6. In Firebase Console, enable authentication:
   - Go to Authentication → Sign-in method
   - Enable **Email/Password**

7. Create Firestore database:
   - Go to Firestore Database → Create database
   - Start in **test mode** (we'll add security rules later)

### Step 3: Add Firebase Swift Packages

1. In Xcode, go to **File → Add Package Dependencies**
2. Enter this URL: `https://github.com/firebase/firebase-ios-sdk`
3. Version: Select **"Up to Next Major Version"** with `10.20.0` (or latest)
4. Click **"Add Package"**
5. When asked which packages to add, select:
   - ✅ **FirebaseAuth**
   - ✅ **FirebaseFirestore**
6. Click **"Add Package"**

### Step 4: Configure Capabilities

1. In Xcode, select your project in the Project Navigator
2. Select the **ScreenTimeShareXCode** target
3. Go to the **"Signing & Capabilities"** tab
4. Click **"+ Capability"** button
5. Add **"Family Controls"** (required for Screen Time API)

**Important Note**: The Family Controls capability requires approval from Apple for App Store distribution. During development, you can test on your own devices.

### Step 5: Build and Run

1. Select a simulator or device (iOS 16.0+)
2. Press **Cmd+R** to build and run
3. The app should launch with the login screen

**Note**: Since Firebase isn't configured yet, the app may show errors. Once you add the `GoogleService-Info.plist` file, it should work!

## Development Workflow

1. **Edit Code**: Use Cursor to edit all `.swift` files
2. **Build/Run**: Use Xcode to build and run on simulator
3. **Debug**: Use Xcode's debugger and console

## Important Notes

### Screen Time API

- Requires **Family Controls** capability
- For testing: Works on your own device during development
- For production: Requires Apple approval for the Family Controls entitlement
- Full implementation requires creating a **DeviceActivityReport** extension (not included yet)

### Firebase Security

- Current Firestore is in **test mode** (open to all)
- Before production, add security rules:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    match /groups/{groupId} {
      allow read: if request.auth != null;
      allow write: if request.auth != null;
    }
    match /screenTimeData/{dataId} {
      allow read, write: if request.auth != null;
    }
  }
}
```

## Next Steps

1. ✅ Project structure created
2. ✅ All Swift files added to Xcode project
3. ⬜ Add Firebase SDK packages
4. ⬜ Add GoogleService-Info.plist
5. ⬜ Enable Family Controls capability
6. ⬜ Test authentication flow
7. ⬜ Implement screen time data fetching (requires DeviceActivityReport extension)
8. ⬜ Build group management features
9. ⬜ Add real-time leaderboard updates

## Troubleshooting

**Build Error: "Module 'Firebase' not found"**
- Make sure you've added the Firebase packages in Step 3
- Clean build folder: Cmd+Shift+K, then rebuild

**Build Error: "Cannot find 'FirebaseApp' in scope"**
- Ensure `GoogleService-Info.plist` is added to the project
- Check that it's included in the target membership

**Screen Time Permission Issues**
- Family Controls capability must be enabled in project settings
- On simulator, some Screen Time features may not work - test on real device

**Authentication Not Working**
- Verify Firebase project is set up correctly
- Check that Email/Password auth is enabled in Firebase Console
- Ensure `GoogleService-Info.plist` bundle ID matches your app

## Git Setup

A `.git` folder already exists. To push to GitHub:

```bash
git add .
git commit -m "Initial ScreenTime Share app setup"
git remote add origin <your-github-repo-url>
git push -u origin main
```

## License

Private project - All rights reserved
