import Foundation

struct TakeHomeResultsResponse<T: Codable>: Codable {
    let status: Int
    let data: [T]
}
