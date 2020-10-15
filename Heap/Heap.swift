//
//  Heap.swift
//  Heap
//
//  Created by Frank McAuley on 10/14/20.
//

import Foundation

/*
 Notes on calculating values:
 1) Parent [i/2] can be computed by shifting i right one bit position
 2) Left 2i can be computed by shifting the binary representation of i left one bit position
 3) Right 2i + 1 can be computed by shifting the binary representation of i left one bit then
 adding in a one as the low-order bit
 */

class Heap {
    
    let baseArray : [Int]
    
    init(_ baseArray: [Int]) {
        self.baseArray = baseArray
    }
    
    // lets build out an interface for an abstract type: Heap
    // A heap has a parent at [i/2]
    func getParent(_ index: Int) -> Int {
        let indexValue = index/2
        return self.baseArray[indexValue]
    }
}
