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

}
