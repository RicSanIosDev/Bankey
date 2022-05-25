//
//  Decimal+Utils.swift
//  Bankey
//
//  Created by Ricardo Sanchez on 24/5/22.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
