//
//  ErrorMessage.swift
//  DotShakeKit
//
//  Created by ChenZhen on 3/10/25.
//

import Foundation

public struct ErrorMessage: Error {
    // MARK: - Properties
    public let id: UUID
    public let title: String
    public let message: String
    
    // MARK: - Methods
    
    public init(title: String, message: String) {
        self.id = UUID()
        self.title = title
        self.message = message
    }
}
