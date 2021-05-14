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
//                let reminders = try response.map(NowMVResults<PrayerReminderNotification>.self)

                completed(.success(hotelResponse.data))
            } catch(let error) {
                completed(.failure(error))
            }
        }
        task.resume()
    }
    
    func downloadImage(from urlString: String, completed: @escaping(UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self,
                  error == nil,
                    let response = response as? HTTPURLResponse, response.statusCode == 200,
                    let data = data,
                    let image = UIImage(data: data) else {
                        completed(nil)
                        return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}

