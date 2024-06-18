import OpenAPIRuntime
import OpenAPIVapor
import Vapor
import EventAPI

@main
struct EventService {
  static func main() async throws {
    let application = try await Vapor.Application.make()
    let transport = VaporTransport(routesBuilder: application)

    let service = EventService()
    try service.registerHandlers(on: transport, serverURL: URL(string: "/v1")!)
    try await application.execute()
  }
}

extension EventService: APIProtocol {

}
