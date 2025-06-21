import Foundation

class APIService {
    static let shared = APIService()
    private init() {}

    private let apiKey = "61a4ed4fc2b14e88bae3b4f93fd2d553"

    func fetchGames(completion: @escaping (Result<[Game], Error>) -> Void) {
        guard let url = URL(string: "https://api.rawg.io/api/games?key=\(apiKey)&page_size=20") else {
            completion(.failure(APIError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(GameResponce.self, from: data)
                completion(.success(decoded.result))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func fetchGameDetail(id: Int, completion: @escaping (Result<Game, Error>) -> Void) {
        guard let url = URL(string: "https://api.rawg.io/api/games/\(id)?key=\(apiKey)") else {
            completion(.failure(APIError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(Game.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

enum APIError: Error {
    case invalidURL
    case noData
}
