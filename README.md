My apologies for the confusion. Here's the previous response in `README.md` format:

# Flutter App for Company Assessment

This repository contains a Flutter app developed for an assessment given by a company. The app is designed to allow users to sign up using their Google or phone number, and it connects to Firebase for authentication and data storage. The app also features a home page designed with a RESTful API, a cart page, and a drawer page.

## Dependencies
- `firebase_core: ^2.11.0`
- `firebase_auth: ^4.5.0`
- `google_sign_in: ^6.1.0`
- `provider: ^6.0.5`
- `badges: ^2.0.2`
- `dio: 5.1.1`
- `shared_preferences: ^2.1.0`

## Pages
- Login Page: Allows users to sign up or log in using their Google or phone number.
- Home Page: Displays products retrieved from a RESTful API.
- Cart Page: Displays products that have been added to the user's cart.
- Drawer Page: Provides navigation options for the app.

## Screenshots

Here are some screenshots of the app:

![Login Page]  (https://res.cloudinary.com/deyoek1lq/image/upload/v1683457496/login_screen_c1ttph.png)

![Phone Number Verification Page](https://res.cloudinary.com/deyoek1lq/image/upload/v1683457496/phone_number_afcpen.png)


![Home Page](https://res.cloudinary.com/deyoek1lq/image/upload/v1683457496/home_screen_nm0gzv.png)

![Cart Page](https://res.cloudinary.com/deyoek1lq/image/upload/v1683457496/cart_screen_pzttb4.png)

![Drawer Page](https://res.cloudinary.com/deyoek1lq/image/upload/v1683457496/drawer_screen_y2i78b.png)



## Usage
To use this app, you will need to have Flutter installed. Once Flutter is installed, you can clone this repository and run the following command to install the required dependencies:

```
flutter pub get
```

You will also need to connect the app to your Firebase project. To do this, you will need to create a new Firebase project and add the `google-services.json` file to the `android/app` directory and the `GoogleService-Info.plist` file to the `ios/Runner` directory. Once you have done this, you can run the app using the following command:

```
flutter run
```

## Contributing
Contributions are welcome! If you have any suggestions or feature requests, please open an issue or a pull request.





