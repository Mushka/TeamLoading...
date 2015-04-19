//
//  Stack.swift
//  PicToWords
//
//  Created by Nikolai Vogler on 4/19/15.
//  Copyright (c) 2015 Nikolai Vogler. All rights reserved.
//

import Foundation

// Stack implementation for deleting proper number of characters
public class Stack<T> {
    var elems = [T]()
    
    func push(elem: T) {
        elems.append(elem)
    }
    
    func pop() -> T {
        return elems.removeLast()
    }
    
    func peek() -> T {
        return elems[elems.endIndex-1]
    }
    
    func isEmpty() -> Bool {
        return elems.count == 0
    }
    
    var count: Int {
        return elems.count
    }
}