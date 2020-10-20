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
    
    private var baseArray : [Int]
    
    init(_ baseArray: [Int]) {
        self.baseArray = baseArray
    }
    
    // lets build out an interface for an abstract type: Heap
    // A heap has a parent at [i/2]
    //1) Parent [i/2] can be computed by shifting i right one bit position
    //** [i/2/ only works for arrays that are 1 based not 0 based
    // 0 based needs (n-1)/2
    func getParent(_ index: Int) -> Int {
        //the parent of root is root
        guard index > 0 else {
            return self.baseArray[0]
        }
        
        // right shift buy one acts are division by 2
        //00000010 = 2
        //00000010 >> 1 == 00000001 = 1
        
        let indexValue = ((index - 1) >> 1)
        return self.baseArray[indexValue]
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
    
    // get index values for Parnet Left Child and Right Child
    func getParentIndex(forPosition index: Int) -> Int {
        
        guard index > 0 else {
            return 0
        }
        return ((index - 1) >> 1)
    }
    
    func getLeftIndex(forPosition index: Int) -> Int {
        return (index << 1) + 1
    }
    
    func getRightIndex(forPosition index: Int) -> Int {
        return (index << 1) + 2
    }
    
    // insert a new value into the heap
    func insert(_ value: Int) {
        self.baseArray.append(value)
        
        var newNodeIndex = self.baseArray.count - 1
        
        while newNodeIndex > 0
                && baseArray[newNodeIndex] > baseArray[getParentIndex(forPosition: newNodeIndex)] {
            
            baseArray.swapAt(newNodeIndex, getParentIndex(forPosition: newNodeIndex))
            newNodeIndex = getParentIndex(forPosition: newNodeIndex)
        }
    }
    
    // need to add functions that Maxify and Minify a heap given an unordered input array
}
