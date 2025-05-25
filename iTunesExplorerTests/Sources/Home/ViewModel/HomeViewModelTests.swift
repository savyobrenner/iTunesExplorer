//
//  HomeViewModelTests.swift
//  iTunesExplorer
//
//  Created by Savyo Brenner on 24/05/25.
//

import XCTest
@testable import iTunesExplorer

final class HomeViewModelTests: XCTestCase {
    private var mockRepository: MockHomeRepository!
    private var mockAnalytics: MockAnalytics!
    private var mockReachability: MockNetworkReachability!
    private var sut: HomeViewModel!

    override func setUp() {
        super.setUp()
        mockRepository = .init()
        mockAnalytics = .init()
        mockReachability = .init()

        sut = HomeViewModel(
            coordinator: nil,
            homeRepository: mockRepository,
            analytics: mockAnalytics,
            reachability: mockReachability
        )
    }
    
    func test_loadData_success_shouldUpdateAlbums() {
        let expectation = XCTestExpectation(description: "Albums updated")
        mockRepository.result = .success([.mock])
        
        let cancellable = sut.$albums
            .dropFirst()
            .sink { albums in
                if albums.count == 1 {
                    expectation.fulfill()
                }
            }
        
        self.sut.loadData()
        
        DispatchQueue.main.async {
            self.wait(for: [expectation], timeout: 2)
            cancellable.cancel()
        }
    }
    
    func test_loadData_failure_shouldTriggerAlert() {
        let expectation = XCTestExpectation(description: "Alert triggered")
        mockRepository.result = .failure(AppError.networkError)
        
        let cancellable = sut.$currentAlert
            .dropFirst()
            .sink { alert in
                if alert?.type == .error {
                    expectation.fulfill()
                }
            }
        
        self.sut.loadData()
        
        DispatchQueue.main.async {
            self.wait(for: [expectation], timeout: 2)
            cancellable.cancel()
        }
    }

    func test_startNetworkMonitoring_shouldUpdateOnlineStatus() {
        let expectation1 = XCTestExpectation(description: "Goes offline")
        let expectation2 = XCTestExpectation(description: "Goes online")

        let cancellable = sut.$isOnline
            .dropFirst()
            .sink { isOnline in
                if isOnline == false {
                    expectation1.fulfill()
                } else {
                    expectation2.fulfill()
                }
            }

        mockReachability.simulateStatusChange(to: false)
        mockReachability.simulateStatusChange(to: true)

        wait(for: [expectation1, expectation2], timeout: 1)
        cancellable.cancel()
    }

    func test_title_generation_shouldContainCountryAndCount() {
        sut.albums = Array(repeating: .mock, count: 5)
        let title = sut.title

        XCTAssertTrue(title.contains("100"))
        XCTAssertTrue(title.contains(sut.userLocale.countryName))
    }

    func test_analytics_event_shouldBeFired_onInit() {
        XCTAssertTrue(mockAnalytics.events.contains(.homeScreen))
    }
}
