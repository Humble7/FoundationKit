//
//  Logger+DotShake.swift
//  FoundationKit
//
//  Created by ChenZhen on 27/12/25.
//

import OSLog

extension Logger {
    private static let subsystem = Bundle.main.bundleIdentifier ?? "com.zion.Doodlefy"

    // MARK: - App-wide Loggers

    /// General app logging
    public static let app = Logger(subsystem: subsystem, category: "App")

    /// UI and view-related logging
    public static let ui = Logger(subsystem: subsystem, category: "UI")

    /// Data and persistence logging
    public static let data = Logger(subsystem: subsystem, category: "Data")

    /// Rendering and graphics logging
    public static let rendering = Logger(subsystem: subsystem, category: "Rendering")

    /// File operations logging
    public static let fileOps = Logger(subsystem: subsystem, category: "FileOps")

    /// Export operations (GIF, LivePhoto, etc.)
    public static let export = Logger(subsystem: subsystem, category: "Export")

    /// Canvas and drawing operations
    public static let canvas = Logger(subsystem: subsystem, category: "Canvas")

    /// Brush engine logging
    public static let brush = Logger(subsystem: subsystem, category: "Brush")

    /// Performance monitoring
    public static let performance = Logger(subsystem: subsystem, category: "Performance")
}
