import SwiftUI

struct GameDetailView: View {
    @StateObject var viewModel = GameDetailViewModel()
    @StateObject var favVM = FavoriteViewModel()
    let gameId: Int

    var body: some View {
        ScrollView {
            if let game = viewModel.game {
                VStack(alignment: .leading, spacing: 16) {
                    if let url = URL(string: game.background_image ?? "") {
                        AsyncImage(url: url) { phase in
                            if let image = phase.image {
                                image.resizable().scaledToFit()
                            } else {
                                ProgressView()
                            }
                        }
                    }

                    Text(game.name)
                        .font(.title)
                        .bold()

                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(String(format: "%.1f", game.rating))
                    }

                    if let desc = game.description_raw {
                        Text(desc)
                            .font(.body)
                    }

                    Button(action: {
                        if favVM.isFavorited(game: game) {
                            if let existing = favVM.favoriteGames.first(where: { $0.id == Int64(game.id) }) {
                                favVM.removeFromFavorite(game: existing)
                            }
                        } else {
                            favVM.addToFavorite(game: game)
                        }
                    }) {
                        HStack {
                            Image(systemName: favVM.isFavorited(game: game) ? "heart.fill" : "heart")
                            Text(favVM.isFavorited(game: game) ? "Hapus dari Favorit" : "Tambah ke Favorit")
                        }
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(8)
                    }
                }
                .padding()
            } else if viewModel.isLoading {
                ProgressView("Memuat Detail...")
            } else if let error = viewModel.errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
            }
        }
        .onAppear {
            viewModel.fetchGameDetail(id: gameId)
            favVM.getFavorites()
        }
        .navigationTitle("Detail")
    }
}
