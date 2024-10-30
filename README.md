# 🕺 Styled : A Social Networking Application

A Flutter-based social networking app that allows users to share images, videos, and text in posts. Users can like and comment on each other’s posts, fostering engagement and community interaction. The app utilizes Firebase for backend services, including user authentication and data storage.

## Features

- **User Authentication**: 
  - Sign up and log in using email/password.
  - Sign in with Google and Facebook accounts.
  
- **Post Creation**: 
  - Users can create posts containing images, videos, and text.
    
- **Image Capture with Filters**: 
  - Capture images directly from the app using a built-in camera feature.
  - Apply various filters to images before posting, enhancing user creativity.
  
- **Engagement**: 
  - Like and comment on posts to interact with other users.
  
- **Local Database**: 
  - Utilize Hive for local storage of saved and liked posts for offline access.

- **Clean Architecture**: 
  - Implement BLoC architecture to separate business logic from the UI, ensuring a clean and maintainable codebase.

## Technologies Used

- **Flutter**: The framework for building the app.
- **Firebase**: 
  - For user authentication and data storage.
  - Firestore for storing user data and posts.
- **Hive**: 
  - Local database for storing saved posts and liked posts.
- **BLoC (Business Logic Component)**: 
  - For managing the state and separating business logic from UI.

## Getting Started

### Prerequisites

- Flutter SDK installed on your machine.
- An IDE such as Android Studio, Visual Studio Code, or IntelliJ IDEA.
- Firebase project set up with authentication methods enabled (Email/Password, Google, Facebook).

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/arman-pani/styled_app.git
   cd styled_app

2. Install dependencies:
   ```bash
   flutter pub get
   
3. Configure Firebase:
   - Follow the instructions to set up Firebase for your Flutter app.
   - Update the google-services.json (for Android) and GoogleService-Info.plist (for iOS) files in your project.

4. Run the app:
   ```bash
   flutter run

## Contributing
Contributions are welcome! If you have suggestions for improvements or new features, feel free to fork the repo and submit a pull request.

## License
This project is licensed under the MIT License - see the LICENSE file for details.
