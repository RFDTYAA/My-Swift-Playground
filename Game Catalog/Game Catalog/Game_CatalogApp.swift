import SwiftUI

@main
struct GameCatalogApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                GameListView()
                    .tabItem {
                        Label("Game", systemImage: "gamecontroller")
                    }

                FavoriteListView()
                    .tabItem {
                        Label("Favorit", systemImage: "heart.fill")
                    }

                AboutView()
                    .tabItem {
                        Label("About", systemImage: "person.circle")
                    }
            }
        }
    }
}
