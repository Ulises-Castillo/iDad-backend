//
//  IDadController.swift
//  App
//
//  Created by Ulysses Castillo on 8/28/19.
//

import Vapor

/// Controls basic CRUD operations on `IDads`s.
final class IDadController: RouteCollection {
    
    let iDads = IDadList.mockData()
    
    var protobufResponse: HTTPResponse? {
        guard let protobuf = try? iDads.serializedData() else {
            print("unable to serialize data")
            return nil
        }
        return HTTPResponse(status: .ok, headers: ["Content-Type": "application/octet-stream"], body: protobuf)
    }
    
    func boot(router: Router) throws {
        let userRoute = router.grouped("iDads")
        userRoute.get(use: index)
    }
    
    /// Returns a list of all `IDads`s.
    func index(_ req: Request) throws -> HTTPResponse {
        guard let response = protobufResponse else {
            return HTTPResponse(status: .internalServerError)
        }
        return response
    }
}
