//
//  JobLabFinalTests.swift
//  JobLabFinalTests
//
//  Created by Natia's Mac on 07.11.22.
//

import XCTest
@testable import JobLabFinal

class checkAPiUrlStatus: XCTestCase {
    let categories = CategoryEnum.allCategoryList
    let categ = CategoryEnum.allCategoryList.filter { str in
        str.hasSuffix("A")
    }

    func testApi() async {

        let urlString =  "https://run.mocky.io/v3/9bc7dc76-c6d1-4491-85db-6218ee67dcc5"

        do {
            let res =  try await APIManager.shared.fetchData(urlString: urlString, decodingType: [JobModel].self).filter({categories.contains($0.category)})

           // test count of the array
            // XCTAssertEqual(res.count, 26, "Failed test result \(res.count)")

            let str = Set(res.map {$0.category})

            XCTAssertTrue(str == Set(categories))

        } catch {

            XCTFail(error.localizedDescription)
        }
    }
}

class CheckURLString: XCTestCase {
    var sut: URLSession!
    let urlString =  "https://run.mocky.io/v3/9bc7dc76-c6d1-4491-85db-6218ee67dcc5"

    override func setUpWithError() throws {
      try super.setUpWithError()
        sut = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testUrlStr() throws {
        // 1. promise
        let url = URL(string: urlString)!
        let promise = expectation(description: "Status code: 200")

        sut.dataTask(with: url) { (_, response, err ) in
            if let err = err {
                XCTFail("Status code: \(err.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("status code: \(statusCode)")
                }
            }
        }.resume()

        // 2. wait
        wait(for: [promise], timeout: 2)
    }
}
