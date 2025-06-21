import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @ObservedObject var profileVM: ProfileViewModel
    @Environment(\.dismiss) var dismiss
    @State private var selectedPhoto: PhotosPickerItem?

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Nama")) {
                    TextField("Masukkan Nama", text: $profileVM.name)
                }

                Section(header: Text("Foto")) {
                    PhotosPicker(selection: $selectedPhoto, matching: .images) {
                        Text("Pilih Foto")
                    }

                    if let data = profileVM.imageData, let uiImage = UIImage(data: data) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                }
            }
            .navigationTitle("Edit Profil")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Simpan") {
                        profileVM.saveProfile()
                        dismiss()
                    }
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Batal") {
                        dismiss()
                    }
                }
            }
            .onChange(of: selectedPhoto) { newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self),
                       let image = UIImage(data: data) {
                        profileVM.updatePhoto(image)
                    }
                }
            }
        }
    }
}
