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
    
    func getLeft(_ index: Int) -> Int? {
        let indexValue = (index << 1) + 1
        if indexValue > self.baseArray.count - 1 {
            return nil
        }
        return self.baseArray[indexValue]
    }
    
    // right = 2n + 2 where n in an index value of an array
    func getRight(_ index: Int) -> Int? {
        
        let indexValue = (index << 1) + 2
        if indexValue > self.baseArray.count - 1 {
            return nil
        }
        return self.baseArray[indexValue]
    }
    
    // get index values for Parnet Left Child and Right Child
    func getParentIndex(forPosition index: Int) -> Int {
        
        guard index > 0 else {
            return 0
        }
        return ((index - 1) >> 1)
    }
    
    func getLeftIndex(forPosition index: Int) -> Int? {
        if ((index << 1) + 1) > baseArray.count {
            return nil
        }
        if baseArray.count < 2 {
            return 0
        }
        return (index << 1) + 1
    }
    
    func getRightIndex(forPosition index: Int) -> Int? {
        if ((index << 1) + 2) > baseArray.count {
            return nil
        }
        if baseArray.count < 2 {
            return 0
        }
        return (index << 1) + 2
    }
    
    // insert a new value into the heap
    func insert(_ value: Int) {
        self.baseArray.append(value)
        
        var newNodeIndex = self.baseArray.count - 1
        
        while newNodeIndex > 0
                && baseArray[newNodeIndex] >
                baseArray[getParentIndex(forPosition: newNodeIndex)] {
            
            baseArray.swapAt(newNodeIndex, getParentIndex(forPosition: newNodeIndex))
            newNodeIndex = getParentIndex(forPosition: newNodeIndex)
        }
    }
    
    // need to add functions that Maxify and Minify a heap given an unordered input array
    
    func delete() {
        // should this function return the value?
        // Or do I need a priority Queue delete that returns out the value
        // then reorders the heap?
        self.baseArray.remove(at: 0)
        //set the right most leaf to the head
        if let last = baseArray.popLast(){
            baseArray.insert(last, at: 0)
        }
        
        // track the node to reposition
        var trackingNodeIndex = 0
        
        while hasLargerChild(trackingNodeIndex) {
            let largestChildIndex = getLargestChild(trackingNodeIndex)
            
            //swap
            baseArray.swapAt(trackingNodeIndex, largestChildIndex)
            
            //update the tracking node index
            trackingNodeIndex = largestChildIndex
        }
    }
    
    //NOTE need to handle the case for optionals.
    //There may be situations where the value asked for is beyond the index
    
    private func hasLargerChild(_ index: Int) -> Bool {
        // need check if there is a left and right and if
        // either left or right is greater
        var leftValue = -1
        if let leftIndex = getLeftIndex(forPosition: index){
            leftValue = baseArray[leftIndex]
        }
        
        var rightValue = -1
        if let rightIndex = getRightIndex(forPosition: index) {
            rightValue = baseArray[rightIndex]
        }
        
        if  leftValue > baseArray[index] || rightValue > baseArray[index]{
            return true
        }
        
        
        return false
    }
    
    private func getLargestChild(_ index: Int) -> Int {
        if getRight(index) == nil {
            if let left = getLeft(index) {
                return left
            }
        }
        
        var leftIndex = -1
        if let leftI = getLeftIndex(forPosition: index){
            leftIndex = leftI
        }
        
        var rightIndex = -1
        if let rightI = getRightIndex(forPosition: index) {
            rightIndex = rightI
        }
        
        if baseArray[rightIndex] > baseArray[leftIndex] {
            return rightIndex
        } else {
            return leftIndex
        }
    }
    
    //Maxify an input array into a Max head 
    func maxify(_ input: [Int]) {
        for x in input {
            insert(x)
        }
    }
    
    
    
    func maxHeapify(_ index: Int) {
        // fix the force unwrap
        let left = getLeftIndex(forPosition: index)
        let right = getRightIndex(forPosition: index)
        
        let leftValue = getLeft(index)
        let rightValue = getRight(index)
        
        
        var largest: Int
        
        if leftValue != nil && left! <= baseArray.count && baseArray[left!] > baseArray[index]{
            largest = left!
        } else {
            largest = index
        }
        
        if rightValue != nil && baseArray[right!] > baseArray[largest] {
            largest = right!
        }
        if largest != index {
            baseArray.swapAt(largest, index)
            maxHeapify(largest)
        }
    }
    
    func buildMaxHeap() {
        var counter = (baseArray.count - 1) / 2
        while counter >= 0 {
            maxHeapify(counter)
            counter -= 1
        }
    }
    
    var heapSortOutput = [Int]()
    
    func heapSort() { //this works like delete...
        buildMaxHeap()
        var counter = baseArray.count - 1
        while counter >= 0 {
            baseArray.swapAt(counter, 0) // here
            heapSortOutput.append(baseArray.popLast()!)
            maxHeapify(0)
            counter -= 1
        }
    }
}
