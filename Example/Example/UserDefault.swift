//
//  UserDefault.swift
//  Example
//
//  Created by Adam Campbell on 22/6/20.
//  Copyright © 2020 Afterpay. All rights reserved.
//

import Foundation

// Taken from: https://www.avanderlee.com/swift/property-wrappers/

@propertyWrapper
struct UserDefault<T> {
  let key: String
  let defaultValue: T

  init(_ key: String, defaultValue: T) {
    self.key = key
    self.defaultValue = defaultValue
  }

  var wrappedValue: T {
    get {
      return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
    }
    set {
      UserDefaults.standard.set(newValue, forKey: key)
    }
  }
}
