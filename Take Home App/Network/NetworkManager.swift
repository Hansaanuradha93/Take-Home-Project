import UIKit

class NetworkManager {
    
    // MARK: Properties
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    // MARK: Initializers
    private init() {}
}


// MARK: - Methods
extension NetworkManager {
    
    func getHotels(completed: @escaping (Result<[Hotel], Error>) -> Void) {
        let urlString = "https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels.json"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completed(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let hotelResponse = try decoder.decode(TakeHome<Hotel>.self, from: data)

                completed(.success(hotelResponse.data))
            } catch(let error) {
                completed(.failure(error))
            }
        }
        task.resume()
    }
}

