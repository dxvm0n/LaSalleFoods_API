import Fluent

struct CreateCartItem: AsyncMigration {

    func prepare(on database: any Database) async throws {
        try await database.schema("cartItem")
            .id()
            .field("restaurant", .uuid, .required)
            .field("quantity", .int, .required)
            .field("image", .string, .required)
            .create()
    }

    func revert(on database: any Database) async throws {
        try await database.schema("cartItem").delete()
    }
}