//
//  SwiftDemoAppTests.swift
//  SwiftDemoAppTests
//
//  Created by Susim on 6/17/14.
//  Copyright (c) 2014 Susim. All rights reserved.
//

import XCTest

class SwiftDemoAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testLoadingApp() {
        AppsManager.getItunesFreeApps { (apps, error) in
            XCTAssertTrue(error != nil, "Error Occured")
            XCTAssertTrue(apps != nil, "Apps Fetched")
            XCTAssertTrue(apps == nil, "No apps")
            /*if error != nil {
                XCTFail("App Service error")
            }else if apps != nil {
                XCTAssert(true, "Pass App Fetched")
            }else {
                XCTFail("No Apps")
            }*/
        }
    }
    
}
