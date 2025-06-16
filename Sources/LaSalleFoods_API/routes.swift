import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    app.get("restaurants") { req async throws -> [Restaurant] in
        let restaurants = try await Restaurant.query(on: req.db).all()
        return restaurants
    }

    app.post("restaurants") { req async throws -> Restaurant in 
        let restaurant = try req.content.decode(Restaurant.self)
        try await restaurant.save(on: req.db)
        return restaurant
    }

    app.delete("restaurants") { req async throws -> HTTPStatus in 
        guard let existingAlbum = try await Restaurant.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound, reason: "Restaurant not found")
        }
        try await existingAlbum.delete(on: req.db)
        return .noContent
    }
    
    try app.register(collection: TodoController())
}
