import SwiftUI

struct AboutView: View {
    @StateObject var profileVM = ProfileViewModel()
    @State private var showEdit = false

    var body: some View {
        VStack(spacing: 16) {
            if let data = profileVM.imageData, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
            } else {
                Image("profile_default")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
            }

            Text(profileVM.name)
                .font(.title2)
                .bold()

            Button("Edit Profil") {
                showEdit = true
            }
            .sheet(isPresented: $showEdit) {
                EditProfileView(profileVM: profileVM)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Tentang Saya")
    }
}
