import Foundation
import CoreData

class FavoriteViewModel: ObservableObject {
    @Published var favoriteGames: [GameEntity] = []

    let context = CoreDataManager.shared.container.viewContext

    func getFavorites() {
        let request = GameEntity.fetchRequest()
        do {
            favoriteGames = try context.fetch(request)
        } catch {
            print("Gagal fetch game favorit: \(error.localizedDescription)")
        }
    }

    func isFavorited(game: Game) -> Bool {
        CoreDataManager.shared.isGameFavorited(id: game.id, context: context)
    }

    func addToFavorite(game: Game) {
        if !isFavorited(game: game) {
            CoreDataManager.shared.addToFavorite(game: game, context: context)
            getFavorites()
        }
    }

    func removeFromFavorite(game: GameEntity) {
        CoreDataManager.shared.removeFromFavorite(game: game, context: context)
        getFavorites()
    }
}
