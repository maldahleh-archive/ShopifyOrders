//
//  OrderedDictionary.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-15.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

struct OrderedDictionary<K: Hashable & Comparable, E> {
    var keys: SortedArray<K> = SortedArray()
    var values: Dictionary<K, [E]> = [:]
    
    subscript(key: K) -> [E]? {
        get {
            return values[key]
        }
    }
}

// MARK: - Helper methods
extension OrderedDictionary {
    func keyAt(index: Int) -> K {
        return keys[index]
    }
    
    mutating func insert(_ element: E, forKey key: K) {
        if keys.contains(key) {
            values[key]!.append(element)
            return
        }
        
        values[key] = [element]
        keys.insert(key)
    }
    
    func valueAt(index: Int) -> [E]? {
        return values[keys[index]]
    }
}
