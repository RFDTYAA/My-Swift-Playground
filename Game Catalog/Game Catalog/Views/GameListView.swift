import SwiftUI

struct GameListView: View {
    @StateObject private var viewModel = GameListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Text("Game Catalog")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top)

                TextField("Cari game", text: $viewModel.searchText)
                    .padding()
                    .background(Color(.darkGray))
                    .cornerRadius(10)
                    .padding()

                if viewModel.isLoading {
                    ProgressView("Memuat data...")
                        .foregroundColor(.gray)
                } else if viewModel.filteredGames.isEmpty {
                    Text("Tidak ada game ditemukan.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List(viewModel.filteredGames) { game in
                        NavigationLink(destination: GameDetailView(gameId: game.id)) {
                            GameRowView(game: game)
                        }
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(.plain)
                }
            }
            .onAppear {
                viewModel.fetchGames()
            }
            .background(Color.black.ignoresSafeArea())
        }
    }
}
