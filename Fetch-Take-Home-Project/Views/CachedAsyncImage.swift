//
//  CachedAsyncImage.swift
//  Fetch-Take-Home-Project
//
//  Created by Dmitry Matveichev on 8/16/24.
//

import SwiftUI

class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
}

struct CachedAsyncImage: View {
    let url: URL?
    let placeholder: Image
    let imageCache = ImageCache.shared
    
    @State private var image: UIImage?
    
    var body: some View {
        if let image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
        } else {
            placeholder
                .resizable()
                .scaledToFit()
                .onAppear(perform: loadImage)
        }
    }
    
    private func loadImage() {
        guard let url else { return }
        let cacheKey = url.absoluteString.md5
        
        if let cachedImage = imageCache.object(forKey: NSString(string: cacheKey)) {
            image = cachedImage
            return
        }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: NSString(string: cacheKey))
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            } catch {
                print("Failed to load image: \(error.localizedDescription)")
            }
        }
    }
}

extension String {
    var md5: String {
        let data = Data(self.utf8)
        let hash = data.map { String(format: "%02hhx", $0) }.joined()
        return hash
    }
}
