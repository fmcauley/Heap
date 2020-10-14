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
        let heap = Heap()
        XCTAssertNotNil(heap)
    }

}
