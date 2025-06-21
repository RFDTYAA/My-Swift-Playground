import Foundation

class GameDetailViewModel: ObservableObject {
    @Published var game: Game?
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchGameDetail(id: Int) {
        isLoading = true
        errorMessage = nil

        APIService.shared.fetchGameDetail(id: id) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let detail):
                    self?.game = detail
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
