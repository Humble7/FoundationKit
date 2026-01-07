//
//  Array+EXT.swift
//  FoundationKit
//
//  Created by ChenZhen on 2/9/25.
//

import Foundation

// MARK: - Array Extension for Safe Access
extension Array {
    public subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension Notification.Name {
    public static let didReceiveDotShakeFile = Notification.Name("didReceiveDotShakeFile")
}
