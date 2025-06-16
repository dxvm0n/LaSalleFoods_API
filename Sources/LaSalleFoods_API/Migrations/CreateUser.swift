import Fluent

struct CreateUser: AsyncMigration {
    
    func prepare(on database: any Database) async throws {
        try await database.schema("user")
            .id()
            .field("password", .string, .required)
            .field("email", .string, .required)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema("user").delete()
    }
}