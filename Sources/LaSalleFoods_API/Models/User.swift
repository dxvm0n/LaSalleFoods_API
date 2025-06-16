import Fluent
import Foundation
import Vapor

final class User: Model, @unchecked Sendable, Content {
    
    static let schema = "user"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "password")
    var password: String
    
    @Field(key: "email")
    var email: String
    
    init() {}
    
    init(id: UUID? = nil, password: String, email: String) {
        self.id = id
        self.password = password
        self.email = email
    }
}