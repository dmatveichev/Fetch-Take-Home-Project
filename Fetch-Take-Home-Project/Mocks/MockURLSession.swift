//
//  MockURLSession.swift
//  Fetch-Take-Home-Project
//
//  Created by Dmitry Matveichev on 8/20/24.
//

import Foundation

class MockURLSession: URLSessionProtocol {
    var data: Data?
    var response: URLResponse?
    var error: Error?

    func data(from url: URL) async throws -> (Data, URLResponse) {
        if let error = error {
            throw error
        }
        guard let data = data, let response = response else {
            throw FetchError.invalidData
        }
        return (data, response)
    }
}
