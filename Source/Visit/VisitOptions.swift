import Foundation

public struct VisitOptions: Codable, JSONCodable {
    public let action: VisitAction
    public let response: VisitResponse?
    public let headers: [String: String]?
        
    public init(action: VisitAction = .advance, response: VisitResponse? = nil, headers: [String: String]? = nil) {
        self.action = action
        self.response = response
        self.headers = headers
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.decodeIfPresent(VisitAction.self, forKey: .action) ?? .advance
        self.response = try container.decodeIfPresent(VisitResponse.self, forKey: .response)
        self.headers = try container.decodeIfPresent([String: String].self, forKey: .headers)
    }
}
