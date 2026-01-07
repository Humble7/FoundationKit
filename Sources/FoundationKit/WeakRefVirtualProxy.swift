//
//  WeakRefVirtualProxy.swift
//  FoundationKit
//
//  Created by ChenZhen on 3/11/25.
//

import Foundation

public final class WeakRefVirtualProxy<T: AnyObject> {
    public weak var object: T?

    public init(_ object: T) {
        self.object = object
    }
}
