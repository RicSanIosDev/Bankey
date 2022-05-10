//
//  LocalState.swift
//  Bankey
//
//  Created by Ricardo Sanchez on 18/4/22.
//

import Foundation

public class LocaleState {
    private enum Keys: String {
        case hasOnboarded
    }

    public static var hasOnboarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
}
