//
//  HeapTests.swift
//  HeapTests
//
//  Created by Frank McAuley on 10/14/20.
//

import XCTest
@testable import Heap

class HeapTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testThatHeapIsNotNil() throws {
        let heap = Heap([0])
        XCTAssertNotNil(heap)
    }
    
    func testThatAHeapTakesAnArrayAsAnInput() {
        let input = [1]
        let _ = Heap(input)
    }
    
    func testThatAHeapHasARootNode() throws {
        let input = [42]
        let heap = Heap(input)
        let output = heap.getParent(0)
        let expected = 42
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatAHeapWillReturnParentWithTwoElementArray() throws {
        let input = [77,88]
        let heap = Heap(input)
        let output = heap.getParent(0)
        let expected = 77
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatHeapCanFindAParentWithAnIndexThatIsPassedIn() throws {
        let input = [99,101]
        let heap = Heap(input)
        let output = heap.getParent(1)
        let expected = 99
        XCTAssertEqual(output, expected)
    }
    
    func testThatICanFindTheParentInALargerArray() throws {
        let input = [17,15,21,3,4,5,6]
        let heap = Heap(input)
        let output = heap.getParent(5)
        let expected = 21
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatHeapCanReturnLeftChild() throws {
        let input = [1,2,3]
        let heap = Heap(input)
        let output = heap.getLeft(0)
        let expected = 2
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatHeapWillReturnTheProperLeftChildWithALargerInputValue() {
        let input = [99,3,78,34,52,2,123]
        let heap = Heap(input)
        let output = heap.getLeft(2)
        let expected = 2
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatHeapCanReturnTheRightSideChild() {
        let input = [3,1,2]
        let heap = Heap(input)
        let output = heap.getRight(0)
        let expected = 2
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatTheHeapWillFindARightChildWithABitShift() {
        let input = [45,67,4,77,123,53,78,97,67]
        let heap = Heap(input)
        let output = heap.getRight(3)
        let expected = 67
        
        XCTAssertEqual(output, expected)
    }
    
    // More test that ensure bit shift works as expected:
    func testThatParentBitShiftWorksInLargerSets() {
        let input = [6,7,9,32,15,8,100,120,188]
        let heap = Heap(input)
        let output = heap.getParent(2)
        let expected = 6
        
        XCTAssertEqual(output, expected)
    }
    
    // Tests that will return the index values for: Parent, Left, and Right
    func testThatParentIndexForSingleElementHeapIsZero() {
        let input = [1000]
        let heap = Heap(input)
        let output = heap.getParentIndex(forPosition: 0)
        let expected = 0
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatParentIndexForLargerInputWorks() {
        let input = [6,7,9,32,15,8,100,120,188]
        let heap = Heap(input)
        let output = heap.getParentIndex(forPosition:2)
        let expected = 0
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatSomthingOtherThanRootWorks() {
        let input = [6,7,9,32,15,8,100,120,188]
        let heap = Heap(input)
        let output = heap.getParentIndex(forPosition:8)
        let expected = 3
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatHeapCanReturnLeftIndexForAGivenPosition() {
        let input = [5,43,3,56,4,78,88,9,900]
        let heap = Heap(input)
        let output = heap.getLeftIndex(forPosition:3)
        let expected = 7
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatHeapCanReturnRightIndexForAGivenPosition() {
        let intput = [234,4,54,665,2,456,7,5,89]
        let heap = Heap(intput)
        let output = heap.getRightIndex(forPosition: 3)
        let expected = 8
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatAHeapCanInsertAValue() {
        let input:[Int] = []
        let heap = Heap(input)
        heap.insert(42)
        let output = heap.getParent(0)
        let expected = 42
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatAHeapCanInsertAValueIntoHeap() {
        let input = [100,90,80]
        let heap = Heap(input)
        heap.insert(70)
        let output = heap.getLeft(1)
        let expected = 70
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatAHeapCanInsertALargeValueThenTrickleItUp() {
        let input = [100,90,80]
        let heap = Heap(input)
        heap.insert(170)
        let output = heap.getParent(0)
        let expected = 170
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatAHeapCanInsertAValueThatIsNotANewRoot() {
        let input = [42,40,38,25,23,31]
        let heap = Heap(input)
        heap.insert(39)
        let output = heap.getRight(0)
        let expected = 39
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatHeapCanDeleteAValue() {
        let input = [42,15]
        let heap = Heap(input)
        //delete will always
        heap.delete()
        let output = heap.getParent(0)
        let expected = 15
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatHeapCanDeleteAndMaintainProperOrder() {
        let input = [42,40,38,29,17,12]
        let heap = Heap(input)
        heap.delete()
        let output = heap.getLeft(0)
        let expected = 29
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatAHeapCanMaxifyAnOrderedArray() {
        let heap = Heap([])
        heap.maxify([1,2,3])
        let output = heap.getParent(0)
        let expected = 3
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatAHeapCanMaxifyALargerUnorderedArray() {
        let heap = Heap([])
        heap.maxify([1,2,3,4,5,6,7,8,9,10])
        let output = heap.getParent(0)
        let expected = 10
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatAHeapCanMaxHeapify() {
        let heap = Heap([42,40,38,49,17,12])
        heap.maxHeapify(1)
        let output = heap.getLeft(0)
        let expected = 49
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatAHeapCanBuildAMaxHeap() {
        let input = [1,2,3,4,5,6,7,8,9]
        let heap = Heap(input)
        heap.buildMaxHeap()
        let output = heap.getParent(0)
        let expected = 9
        
        XCTAssertEqual(output, expected)
    }

    func testThatHeapSortWillWork() {
        let input = [1,2,3]
        let heap = Heap(input)
        heap.heapSort()
        let output = heap.getParent(0)
        let expected = 3
        
        XCTAssertEqual(output, expected)
    }
    
    func testThatHeapSortWorksWithALargerInputSet() {
        let input = [4,1,3,2,16,9,10,14,8,7]
        let heap = Heap(input)
        heap.heapSort()
    
    }

}
