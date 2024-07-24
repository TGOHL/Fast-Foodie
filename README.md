# Fast Foodie Flutter App

## Project Overview

This Flutter application allows users to search for nearby restaurants, view details, and save their favorite restaurants locally on their device. The app integrates with a REST API, provides a clean and responsive UI, and is deployable on both iOS and Android devices.

## Features

- **Search Fast Foodie:** Find restaurants based on the user’s current location.
- **View Restaurant Details:** Access detailed information about each restaurant.
- **Save Favorites:** Securely store favorite restaurants locally.
- **Map View:** Display restaurant locations on a map.

## Requirements

### Data Security

- Implement secure local storage for saving favorite restaurants using `flutter_secure_storage` or a similar Flutter package.

### Geolocation

- Utilize geolocation to find and display nearby restaurants.
- Use a map view to show restaurant locations with `google_maps_flutter` or `flutter_map`.

### REST API

- Integrate with the Foursquare Places API for fetching restaurant data: [Foursquare API Documentation](https://docs.foursquare.com/developer/reference/places-api-overview).
- Handle API requests and responses efficiently, including proper error handling.

### UI Standards

- Design a clean, intuitive, and responsive UI following Material Design guidelines.
- Include screens for:
  - Restaurant listing
  - Restaurant details
  - Favorites list

### Dart and Flutter Knowledge

- Demonstrate proficiency in Dart and Flutter with clean, well-documented, and efficient code.
- Use Bloc for state management solutions.

## Setup Instructions

### Prerequisites

- Ensure you have Flutter and Dart SDK installed.
- Set up an API key for the Foursquare Places API.
- Configure Google Maps API key if using `google_maps_flutter`.

### Installation

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/TGOHL/Fast-Foodie.git
    cd Fast-Foodie
    ```

2. **Install Dependencies:**

    ```bash
    flutter pub get
    ```

3. **Configure API Keys:**

    - Add your Foursquare API key and Google Maps API key to the appropriate configuration files.

4. **Run the App:**

    ```bash
    flutter run
    ```
## Contribution

For any issues or contributions, please refer to the GitHub repository and open an issue or pull request.
