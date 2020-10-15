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
        let heap = Heap(input)
        let output = heap.baseArray.count
        let expected = 1
        
        XCTAssertEqual(output, expected)
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

}
