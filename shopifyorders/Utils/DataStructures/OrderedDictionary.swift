//
//  OrderedDictionary.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-15.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

struct OrderedDictionary<K: Hashable & Comparable, E> {
    fileprivate var keys: SortedArray<K>
    fileprivate var values: Dictionary<K, [E]> = [:]
    
    public init(inIncreasingOrder: Bool) {
        self.keys = SortedArray(inIncreasingOrder: inIncreasingOrder)
    }
    
    subscript(key: K) -> [E]? {
        get {
            return values[key]
        }
    }
}

// MARK: - Helper methods
extension OrderedDictionary {
    mutating func insert(_ element: E, forKey key: K) {
        if keys.contains(key) {
            values[key]!.append(element)
            return
        }
        
        values[key] = [element]
        keys.insert(key)
    }
    
    func keyAt(index: Int) -> K {
        return keys[index]
    }
    
    func valueAt(index: Int) -> [E]? {
        return values[keys[index]]
    }
    
    func elementAt(index: Int, subindex: Int) -> E? {
        return valueAt(index: index)?[subindex]
    }
    
    func totalKeys() -> Int {
        return keys.count
    }
}
