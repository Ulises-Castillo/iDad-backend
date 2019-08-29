import Vapor

public func routes(_ router: Router) throws {
    
    let iDadController = IDadController()
    router.get("", use: iDadController.index)
}
