//
//  ConfigManager.swift
//  Australia
//

import Foundation

// MARK: - ConfigManager to Read from Plist
class ConfigManager {
    static func getFileName(forKey key: String) -> String? {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path) as? [String: Any] else {
            return nil
        }
        return dict[key] as? String
    }
}
