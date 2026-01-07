//
//  DebugLog.swift
//  DotShakeColorPicker
//
//  Created by ChenZhen on 27/12/25.
//

import Foundation
import os

// MARK: - DebugLog

enum DebugLog {

    // MARK: - Configuration

    #if DEBUG
    /// Storage for configured loggers by category
    @usableFromInline
    nonisolated(unsafe) static var loggers: [String: Logger] = [:]

    /// Default subsystem (bundle identifier)
    @usableFromInline
    nonisolated(unsafe) static var defaultSubsystem: String = Bundle.main.bundleIdentifier ?? "App"

    /// Default category
    @usableFromInline
    nonisolated(unsafe) static var defaultCategory: String = "Debug"
    #endif

    /// Configure the default subsystem and category
    /// Call this early in app launch (e.g., in AppDelegate)
    @inlinable
    nonisolated static func configure(subsystem: String? = nil, category: String? = nil) {
        #if DEBUG
        if let subsystem { defaultSubsystem = subsystem }
        if let category { defaultCategory = category }
        #endif
    }

    // MARK: - Logger Access

    #if DEBUG
    @usableFromInline
    nonisolated static func logger(category: String? = nil) -> Logger {
        let cat = category ?? defaultCategory
        if let existing = loggers[cat] {
            return existing
        }
        let newLogger = Logger(subsystem: defaultSubsystem, category: cat)
        loggers[cat] = newLogger
        return newLogger
    }
    #endif

    // MARK: - Simple Logging

    @inlinable
    nonisolated static func debug(_ message: @autoclosure () -> String, category: String? = nil) {
        #if DEBUG
        let msg = message()
        logger(category: category).debug("\(msg)")
        #endif
    }

    @inlinable
    nonisolated static func info(_ message: @autoclosure () -> String, category: String? = nil) {
        #if DEBUG
        let msg = message()
        logger(category: category).info("\(msg)")
        #endif
    }

    @inlinable
    nonisolated static func error(_ message: @autoclosure () -> String, category: String? = nil) {
        #if DEBUG
        let msg = message()
        logger(category: category).error("\(msg)")
        #endif
    }

    // MARK: - Timing Measurement (Sync)

    @inlinable
    nonisolated static func measure<T>(
        _ name: @autoclosure () -> String,
        category: String? = nil,
        _ work: () throws -> T
    ) rethrows -> T {
        #if DEBUG
        let label = name()
        let start = CFAbsoluteTimeGetCurrent()
        let result = try work()
        let elapsed = (CFAbsoluteTimeGetCurrent() - start) * 1000
        let formatted = String(format: "%.2f", elapsed)
        logger(category: category).debug("\(label): \(formatted)ms")
        return result
        #else
        return try work()
        #endif
    }

    // MARK: - Timing Measurement (Async)

    @inlinable
    static func measure<T: Sendable>(
        _ name: @autoclosure () -> String,
        category: String? = nil,
        isolation: isolated (any Actor)? = #isolation,
        _ work: () async throws -> T
    ) async rethrows -> T {
        #if DEBUG
        let label = name()
        let start = CFAbsoluteTimeGetCurrent()
        let result = try await work()
        let elapsed = (CFAbsoluteTimeGetCurrent() - start) * 1000
        let formatted = String(format: "%.2f", elapsed)
        logger(category: category).debug("\(label): \(formatted)ms")
        return result
        #else
        return try await work()
        #endif
    }
}
