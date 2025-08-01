# Barber Booking App

A modern Flutter application for booking barber services with both user and admin interfaces. This app provides a seamless booking experience for customers and efficient management tools for barbers.

## 🎯 Personal Learning Journey

This project represents my first hands-on experience with Firebase after learning about it. As a developer who's still learning and exploring Firebase's capabilities, this app serves as a practical implementation of:

- **Firebase Authentication** - My first time implementing user login/signup
- **Cloud Firestore** - Learning real-time database operations
- **Firebase Realtime Database** - Understanding data synchronization
- **Local Notifications** - Exploring push notification systems

This project has been an incredible learning experience, helping me understand the power of Firebase as a backend-as-a-service solution. Every feature implemented has been a step forward in my Firebase learning journey!

## 🚀 Features

### User Features
- **User Authentication**: Secure login and signup with Firebase Authentication
- **Service Booking**: Book various barber services including:
  - Hair cutting
  - Beard trimming
  - Shaving
  - Facials
  - Kids haircuts
- **Appointment Management**: Schedule appointments with date and time selection
- **User Profile**: Personal profile management with profile pictures
- **Onboarding**: Welcome screens for new users
- **Real-time Updates**: Live booking status updates
- **Booking Confirmation**: Success notifications and automatic navigation
- **Error Handling**: Comprehensive error handling with user feedback

### Admin Features
- **Admin Dashboard**: Comprehensive dashboard for barbers
- **Booking Management**: View and manage all customer bookings
- **Real-time Notifications**: Instant notifications for new bookings
- **Customer Information**: Access to customer details and booking history

## 🛠️ Technology Stack

- **Framework**: Flutter 3.8.1+
- **Backend**: Firebase
  - Firebase Authentication
  - Cloud Firestore
  - Firebase Realtime Database
- **Local Storage**: Shared Preferences
- **Notifications**: Flutter Local Notifications
- **UI**: Material Design with custom styling

## 📱 Screenshots

The app includes various service images and a modern UI with:
- Gradient backgrounds
- Custom service cards
- Professional barber imagery
- Discount promotions

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Firebase project setup

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/AbuZafor99/Barber-shop-service-booking-app.git
   cd barber_booking_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a new Firebase project
   - Enable Authentication, Firestore, and Realtime Database
   - Download and add the configuration files:
     - `google-services.json` for Android
     - `GoogleService-Info.plist` for iOS

4. **Run the app**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── admin/                    # Admin functionality
│   ├── screens/
│   │   ├── admin_login_screen.dart
│   │   └── admin_dashboard_screen.dart
│   └── services/
│       └── notification_service.dart
└── user/                     # User functionality
    ├── screens/
    │   ├── splash_screen.dart
    │   ├── onbording_screen.dart
    │   ├── login_screen.dart
    │   ├── signup_screen.dart
    │   ├── home_screen.dart
    │   └── booking_screen.dart
    ├── services/
    │   ├── database.dart
    │   └── shared_pref.dart
    └── widgets/
        ├── main_button.dart
        ├── screens_bg.dart
        └── services_card.dart
```

## 🔧 Configuration

### Firebase Configuration

1. **Authentication**: Enable Email/Password authentication
2. **Firestore**: Set up collections for users and bookings
3. **Security Rules**: Configure appropriate security rules for your collections

### Environment Setup

The app uses the following environment variables and configurations:
- Firebase project configuration
- Notification settings
- Shared preferences for user data

## 📊 Database Schema

### Users Collection
```json
{
  "Email": "user@example.com",
  "Name": "User Name",
  "Image": "profile_image_url"
}
```

### Bookings Collection
```json
{
  "Service": "Hair Cut",
  "Date": "15/1/2024",
  "Time": "2:30 PM",
  "UserName": "User Name",
  "UserEmail": "user@example.com",
  "Image": "user_image_url",
  "BookingTime": 1705312200000
}
```

## 🎨 UI/UX Features

- **Modern Design**: Clean and professional interface
- **Responsive Layout**: Works on various screen sizes
- **Custom Gradients**: Beautiful color schemes
- **Service Cards**: Interactive service selection
- **Loading States**: Smooth user experience with loading indicators

## 🔐 Security Features

- Firebase Authentication for secure user management
- Firestore security rules for data protection
- Input validation and sanitization
- Secure data storage with Shared Preferences

## 📱 Platform Support

- ✅ Android
- ✅ iOS
- ✅ Web (Flutter Web)
- ✅ Desktop (Windows, macOS, Linux)

## 🚀 Deployment

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- **Abu Zafor** - *Initial work* - [GitHub](https://github.com/AbuZafor99)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services and the incredible learning experience
- The Flutter community for packages and support
- My learning journey with Firebase - this project represents my growth as a developer

## 📞 Support

For support, create an issue in the [GitHub repository](https://github.com/AbuZafor99/Barber-shop-service-booking-app) or reach out through GitHub.

## 🔗 Repository

- **GitHub**: [https://github.com/AbuZafor99/Barber-shop-service-booking-app](https://github.com/AbuZafor99/Barber-shop-service-booking-app)
- **Live Demo**: Coming soon

---

**Note**: Make sure to configure Firebase properly before running the app. The app requires internet connection for full functionality.

**Learning Note**: This project was built as part of my Firebase learning journey. If you're also learning Firebase, feel free to explore the code and reach out with questions. We're all learning together! 🚀
