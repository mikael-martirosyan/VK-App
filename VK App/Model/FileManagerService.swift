//
//  FileManagerService.swift
//  VK App
//
//  Created by Микаэл Мартиросян on 20.05.2022.
//

import UIKit

class FileManagerService {
    
    private let cachesLifeTime: TimeInterval = 30 * 24 * 60 * 60
    private var images = [String: UIImage]()
    
    let pathName: String = {
        let pathName = "images"
        
        guard let cachesDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return pathName }
        
        let url = cachesDirectory.appendingPathComponent(pathName, isDirectory: true)
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch {
                print(error)
            }
        }
        
        return pathName
    }()
    
    private func getFilePath(url: String) -> String? {
        guard let cachesDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        let hashName = url.split(separator: "/").last ?? "default"
        return cachesDirectory.appendingPathComponent(pathName + "/" + hashName).path
    }
    
    func saveImageToCache(url: String, image: UIImage) {
        guard let fileName = getFilePath(url: url),
              let data = image.pngData()
        else { return }
        
        FileManager.default.createFile(atPath: fileName, contents: data)
    }
    
    func getImageFromCache(url: String) -> UIImage? {
        guard let fileName = getFilePath(url: url),
              let info = try? FileManager.default.attributesOfItem(atPath: fileName),
              let modificationDate = info[.modificationDate] as? Date
        else { return nil }
        
        let lifeTime = Date().timeIntervalSince(modificationDate)
        
        guard
            lifeTime <= cachesLifeTime,
            let image = UIImage(contentsOfFile: fileName)
        else { return nil }
        
        DispatchQueue.main.async {
            self.images[url] = image
        }
        
        return image
    }
}
