import Fluent
import Vapor
import Foundation

final class Restaurant : Model, @unchecked Sendable, Content {

    static let schema = "restaurant"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    @Field(key: "rating")
    var rating: Double

    @Field(key: "estimatedTime")
    var estimatedTime: String

    @Field(key: "category")
    var category: String

    @Field(key: "imageName")
    var imageName: String

    @Field(key: "hasPromotion")
    var hasPromotion: Bool

    init() {}
    
    init(id: UUID? = nil, name: String, rating: Double, estimatedTime: String, category: String, imageName: String, hasPromotion: Bool) {
        self.id = id
        self.name = name
        self.rating = rating
        self.estimatedTime = estimatedTime
        self.category = category
        self.imageName = imageName
        self.hasPromotion = hasPromotion
    }
}