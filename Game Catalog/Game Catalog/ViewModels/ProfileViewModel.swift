import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var imageData: Data?

    private let nameKey = "profile_name"
    private let imageKey = "profile_image"

    init() {
        loadProfile()
    }

    func loadProfile() {
        name = UserDefaults.standard.string(forKey: nameKey) ?? "Muhammad Rafi Aditya"

        if let savedData = UserDefaults.standard.data(forKey: imageKey) {
            imageData = savedData
        }
    }

    func saveProfile() {
        UserDefaults.standard.set(name, forKey: nameKey)

        if let imageData = imageData {
            UserDefaults.standard.set(imageData, forKey: imageKey)
        }
    }

    func updatePhoto(_ image: UIImage) {
        self.imageData = image.jpegData(compressionQuality: 0.8)
        saveProfile()
    }
}
