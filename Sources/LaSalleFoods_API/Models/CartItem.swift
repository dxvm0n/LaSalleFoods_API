import Fluent
import Vapor
import Foundation

final class CartItem: Model, @unchecked Sendable, Content {
    
    static let schema = "cartItem"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "restaurant")
    var restaurant: UUID
    
    @Field(key: "quantity")
    var quantity: Int

    @Field(key: "image")
    var image: String
    
    init() {}
    
    init(id: UUID? = nil, restaurant: UUID, quantity: Int, image: String) {
        self.id = id
        self.restaurant = restaurant
        self.quantity = quantity
        self.image = image
    }
}