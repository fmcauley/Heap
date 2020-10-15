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
    
    private let baseArray : [Int]
    
    init(_ baseArray: [Int]) {
        self.baseArray = baseArray
    }
    
    // lets build out an interface for an abstract type: Heap
    // A heap has a parent at [i/2]
    //1) Parent [i/2] can be computed by shifting i right one bit position
    func getParent(_ index: Int) -> Int {
        return self.baseArray[index >> 1]
    }
    
    // left = 2n + 1 where n is an index value of an array
    
    func getLeft(_ index: Int) -> Int {
        let indexValue = (index << 1) + 1
        return self.baseArray[indexValue]
    }
    
    // right = 2n + 2 where n in an index value of an array
    func getRight(_ index: Int) -> Int {
        let indexValue = (index << 1) + 2
        return self.baseArray[indexValue]
    }
}
