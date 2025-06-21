import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "FavoriteModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data error: \(error.localizedDescription)")
            }
        }
    }

    func save(context: NSManagedObjectContext) {
        if context.hasChanges {
            try? context.save()
        }
    }

    func addToFavorite(game: Game, context: NSManagedObjectContext) {
        let newItem = GameEntity(context: context)
        newItem.id = Int64(game.id)
        newItem.name = game.name
        newItem.released = game.released
        newItem.rating = game.rating
        newItem.imageURL = game.background_image
        save(context: context)
    }

    func removeFromFavorite(game: GameEntity, context: NSManagedObjectContext) {
        context.delete(game)
        save(context: context)
    }

    func isGameFavorited(id: Int, context: NSManagedObjectContext) -> Bool {
        let request: NSFetchRequest<GameEntity> = GameEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", id)
        return (try? context.fetch(request))?.isEmpty == false
    }
}
