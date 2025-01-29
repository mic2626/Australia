//
//  CityModel.swift
//  Australia
//
import Foundation

// MARK: - Models
struct City: Codable, Identifiable {
    var id = UUID()
    let city: String
    let adminName: String
    let population: String
    let lat: String
    let lng: String
    let country: String
    let iso2: String
    let capital: String
    let populationProper: String
    
    enum CodingKeys: String, CodingKey {
        case city
        case adminName = "admin_name"
        case population
        case lat
        case lng
        case country
        case iso2
        case capital
        case populationProper = "population_proper"
    }
}
