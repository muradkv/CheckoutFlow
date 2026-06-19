//
//  PathStore.swift
//  CheckoutFlow
//
//  Created by murad on 19.06.2026.
//

import SwiftUI

@Observable
final class PathStore {
    var path = NavigationPath() {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedNavigationPath")
    
    init() {
        guard let data = try? Data(contentsOf: savePath) else { return }
        
        if let representation = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
            self.path = NavigationPath(representation)
            print("🎉 Navigation stack successfully restored from disk!")
            return
        }
    }
    
    private func save() {
        guard let representation = path.codable else {
            print("⚠️ Failed to generate codable representation. Check your types.")
            return
        }
        
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(
                        to: savePath,
                        options: [.atomic, .completeFileProtection])
            print("💾 Navigation stack encoded and saved atomically.")
        } catch {
            print("❌ Failed to save navigation: \(error.localizedDescription)")
        }
    }
}
