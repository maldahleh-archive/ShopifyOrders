//
//  Result.swift
//  shopifyorders
//
//  Created by Mohammed Al-Dahleh on 2018-07-13.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

enum Result<T, U> where U: Error {
    case success(T)
    case failure(U)
}
