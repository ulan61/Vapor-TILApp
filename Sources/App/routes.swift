import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    router.post("api", "acronyms") { req -> Future<Acronym> in
        try req.content.decode(Acronym.self).flatMap(to: Acronym.self) { acronym in
            acronym.save(on: req)
        }
    }
}
