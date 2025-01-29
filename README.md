# Australian Cities SwiftUI App

This project is a SwiftUI application that loads data of Australian states and their cities from a JSON file and displays it in a dynamic and interactive list. The cities are grouped by state, and users can expand/collapse sections of each state to view cities and their details. A splash screen is displayed when the app launches.

## Features
- **Dynamic List**: Cities are grouped by state and displayed in a collapsible list format.
- **Data Caching**: The app uses caching for optimized performance. If the data is available in the cache, it loads from there.
- **State Reversal**: Users can reverse the order of cities within a state.
- **Splash Screen**: A splash screen appears when the app is launched and disappears after a short delay.
- **City Details**: Tapping a city in the list opens a detail view displaying information about the city's location, population, and more.

## Structure

### Models
- **City**: A `Codable` struct representing a city with properties like `city`, `adminName`, `population`, `lat`, `lng`, `country`, `iso2`, `capital`, and `populationProper`.

### ViewModel
- **CityListViewModel**: A class that manages the data and state for displaying cities. It handles loading, parsing, and grouping city data by state, along with toggling the reverse order for state sections.

### Views
- **LandingView**: The main view where cities are displayed grouped by state.
- **CityDetailView**: A detail view showing information about a specific city.
- **SplashScreenView**: A view that shows a splash screen with an icon and welcome message.
  
### Cache
- **DataCache**: A protocol and default implementation (`DefaultDataCache`) for caching city data to avoid reloading it from the file every time.
  
### Configuration
- **ConfigManager**: A utility to read configuration data, such as the filename for the cities JSON, from a `Config.plist` file.

### Unit Tests
- **LandingViewTests**: Tests for ensuring the data is loaded correctly and for the section toggle behavior.
- **CityListViewModelTests**: Tests for the `CityListViewModel`, including loading data from cache, fetching data from a file, grouping cities, and toggling the reverse order.
- **Snapshot Tests**: Tests for taking snapshots of views in both light and dark modes to ensure visual consistency.

## Setup

1. Clone the repository:
   ```bash
   git clone <repository-url>
   
2. Open the project in Xcode:
   ```bash
   open Australia.xcodeproj

3. Run the project on a simulator or a real device.

4. The app loads Australian city data from a cities.json file located in the app's main bundle. Make sure to provide this file in your Xcode project.

5. Optionally, configure the filename for the JSON file in the Config.plist file:
   xml
      <key>CityFileName</key>
      <string>cities</string>

## Unit Tests
To run unit tests, use Xcode's built-in testing functionality:
1. Press Cmd + U to run all tests.
2. Tests include:
   - Verifying the data loading process.
   - Checking section expansion behavior.
   - Testing the CityListViewModel functionality, such as data caching and parsing.
     
## Snapshot Tests
1. The project also includes snapshot tests using SnapshotTesting for various views.
2. To run snapshot tests, ensure you have the required test images by running the tests for LandingView, CityDetailView, and SplashScreenView.
