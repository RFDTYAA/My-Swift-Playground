import SwiftUI

struct GameRowView: View {
    let game: Game

    var body: some View {
        HStack {
            if let url = URL(string: game.background_image ?? "") {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipped()
                            .cornerRadius(8)
                    default:
                        Image(systemName: "photo")
                            .frame(width: 80, height: 80)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
            }

            VStack(alignment: .leading) {
                Text(game.name)
                    .font(.headline)

                Text("Released: \(game.released ?? "-")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(String(format: "%.1f", game.rating))
                        .font(.subheadline)
                }
            }
        }
        .padding(.vertical, 8)
    }
}
