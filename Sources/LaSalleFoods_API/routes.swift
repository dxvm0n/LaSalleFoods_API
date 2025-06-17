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

    app.delete("restaurants", ":id") { req async throws -> HTTPStatus in 
        guard let existingRestaurant = try await Restaurant.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound, reason: "Restaurant not found")
        }
        try await existingRestaurant.delete(on: req.db)
        return .noContent
    }
    
    app.get("cartItems") { req async throws -> [CartItem] in
        let cartItems = try await CartItem.query(on: req.db).all()
        return cartItems
    }

    app.post("cartItems") { req async throws -> CartItem in 
        let cartItem = try req.content.decode(CartItem.self)
        try await cartItem.save(on: req.db)
        return cartItem
    }

    app.delete("cartItems", ":id") { req async throws -> HTTPStatus in 
        guard let existingCartItem = try await CartItem.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound, reason: "CartItem not found")
        }
        try await existingCartItem.delete(on: req.db)
        return .noContent
    }

    try app.register(collection: TodoController())
}
