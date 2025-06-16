import Fluent

struct CreateRestaurant: AsyncMigration {

    func prepare(on database: any Database) async throws {
        try await database.schema("restaurant")
            .id()
            .field("name", .string, .required)
            .field("rating", .double, .required)
            .field("estimatedTime", .string, .required)
            .field("category", .string, .required)
            .field("imageName", .custom("VARCHAR(500)"), .required)
            .field("hasPromotion", .bool, .required)
            .create()
    }

    func revert(on database: any Database) async throws {
        try await database.schema("restaurant").delete()
    }
}