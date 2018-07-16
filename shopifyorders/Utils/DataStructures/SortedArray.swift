//
//  SortedArray.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-15.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

public struct SortedArray<Element> where Element: Comparable {
    public typealias Comparator<A> = (A, A) -> Bool
    
    fileprivate var _elements: [Element]
    fileprivate let inIncreasingOrder: Comparator<Element>
    
    public init() {
        self.init(inIncreasingOrder: <)
    }
    
    public init(inIncreasingOrder: @escaping Comparator<Element>) {
        self._elements = []
        self.inIncreasingOrder = inIncreasingOrder
    }
    
    public mutating func insert(_ newElement: Element) {
        if index(of: newElement) != nil { return }
        _elements.insert(newElement, at: insertionIndex(for: newElement))
    }
    
    public mutating func remove(_ element: Element) {
        guard let index = index(of: element) else { return }
        _elements.remove(at: index)
    }
}

// MARK: - RandomAccessCollection
extension SortedArray: RandomAccessCollection {
    public typealias Index = Int
    
    public var startIndex: Index { return _elements.startIndex }
    public var endIndex: Index { return _elements.endIndex }
    
    public subscript(position: Index) -> Element {
        return _elements[position]
    }
}

extension SortedArray {
    public func index(of element: Element) -> Index? {
        switch search(for: element) {
        case let .found(at: index): return index
        case .notFound(insertAt: _): return nil
        }
    }
    
    public func contains(_ element: Element) -> Bool {
        return index(of: element) != nil
    }
}

// MARK: - Binary search
extension SortedArray {
    fileprivate func insertionIndex(for newElement: Element) -> Index {
        switch search(for: newElement) {
        case let .found(at: index): return index
        case let .notFound(insertAt: index): return index
        }
    }
}

fileprivate enum Match<Index: Comparable> {
    case found(at: Index)
    case notFound(insertAt: Index)
}

extension Range where Bound == Int {
    var middle: Int? {
        guard !isEmpty else { return nil }
        return lowerBound + count / 2
    }
}

extension SortedArray {
    fileprivate func search(for element: Element) -> Match<Index> {
        return search(for: element, in: startIndex ..< endIndex)
    }
    
    fileprivate func search(for element: Element, in range: Range<Index>) -> Match<Index> {
        guard let middle = range.middle else { return .notFound(insertAt: range.upperBound) }
        switch compare(element, self[middle]) {
        case .orderedDescending:
            return search(for: element, in: index(after: middle)..<range.upperBound)
        case .orderedAscending:
            return search(for: element, in: range.lowerBound..<middle)
        case .orderedSame:
            return .found(at: middle)
        }
    }
    
    fileprivate func compare(_ lhs: Element, _ rhs: Element) -> Foundation.ComparisonResult {
        if inIncreasingOrder(lhs, rhs) {
            return .orderedAscending
        } else if inIncreasingOrder(rhs, lhs) {
            return .orderedDescending
        } else {
            return .orderedSame
        }
    }
}
