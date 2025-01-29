//
//  LocalizationConstants.swift
//  BupaAustralia

import Foundation

struct Localization {
    struct ViewModel {
        static let fileName = NSLocalizedString("file_name", comment: "JSON file name")
        static let missingFile = NSLocalizedString("missing_file", comment: "JSON file missing error")
    }
    
    
    struct CityDetail {
        static let title = NSLocalizedString("cityDetail_title", comment: "Title for the city details screen")
        static let state = NSLocalizedString("state_title", comment: "Label for state")
        static let country = NSLocalizedString("country_title", comment: "Label for country")
        static let latitude = NSLocalizedString("latitude_title", comment: "Label for latitude")
        static let longitude = NSLocalizedString("longitude_title", comment: "Label for longitude")
        static let population = NSLocalizedString("population_title", comment: "Label for population")
        static let capital = NSLocalizedString("capital_title", comment: "Label for capital")
        static let iso2 = NSLocalizedString("iso2_title", comment: "Label for ISO2 code")
        static let locationIcon = NSLocalizedString("location_image", comment: "Location image") //"flag_image"
        static let flagIcon = NSLocalizedString("flag_image", comment: "Flag image")
    }
    
    struct LandingView {
        static let title = NSLocalizedString("australian_cities", comment: "Australian Cities")
        static let navBarItemTitle = NSLocalizedString("reverse_order", comment: "Reverse order")
    }
    
    struct SplashScreen {
        static let welcomeMessage = NSLocalizedString("welcome_message", comment: "Welcome message")
        static let globeIcon = NSLocalizedString("globe_image", comment: "Globe image")
    }
    
}
