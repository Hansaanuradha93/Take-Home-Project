import Foundation

struct TakeHome<T: Codable>: Codable {
    let status: Int
    let data: [T]
}
