import SwiftUI

struct FavoriteListView: View {
    @StateObject private var viewModel = FavoriteViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.favoriteGames.isEmpty {
                    Spacer()
                    VStack {
                        Image(systemName: "heart.slash")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                        Text("Belum ada game favorit.")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                } else {
                    List {
                        ForEach(viewModel.favoriteGames) { game in
                            NavigationLink(
                                destination: GameDetailView(gameId: Int(game.id))) {
                                HStack {
                                    if let urlStr = game.imageURL, let url = URL(string: urlStr) {
                                        AsyncImage(url: url) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(8)
                                    }
                                    VStack(alignment: .leading) {
                                        Text(game.name ?? "-")
                                            .font(.headline)
                                        Text("Released: \(game.released ?? "-")")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        HStack {
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                            Text(String(format: "%.1f", game.rating))
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favorit")
            .onAppear {
                viewModel.getFavorites()
            }
        }
    }
}
