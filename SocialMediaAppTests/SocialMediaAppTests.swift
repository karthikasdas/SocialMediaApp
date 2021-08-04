//
//  SocialMediaAppTests.swift
//  SocialMediaAppTests
//
//  Created by Karthika on 8/2/21.
//

import XCTest
@testable import SocialMediaApp

class SocialMediaAppTests: XCTestCase {
    
    private func createSUT() -> FeedListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "FeedListViewController") as! FeedListViewController
    }

    func test_TableView() {
        let feedListViewCountroller = createSUT()
        feedListViewCountroller.loadViewIfNeeded()
        XCTAssertNotNil(feedListViewCountroller.tableView)
    }
    
    func test_rowShowsCorrectFeed() {
        let feed = CommonValue([ListOfFeed(id: 1, userID: 2, title: "Title", body: "Body"),ListOfFeed(id: 2, userID: 3, title: "Title2", body: "Body2")])
        let sut = FeedListDataSource()
        sut.feed_data = feed
        let vc = createSUT()
        vc.loadViewIfNeeded()
        let tablewView = vc.tableView!
        tablewView.dataSource = sut
        tablewView.reloadData()
        let cell = tablewView.cellForRow(at: IndexPath(row: 0, section: 0)) as? FeedListCell
        XCTAssertEqual("Body", cell?.cellData.body)
        XCTAssertEqual("CELL_FEED_LIST", cell?.reuseIdentifier)
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
