//
//  MyFileFunctions.swift
//  File System Demo
//
//  Created by Noah Kellem on 4/10/17.
//  Copyright © 2017 Noah Kellem. All rights reserved.
//

import Foundation
import UIKit
//Helper methods and properties for loading and saving files to disk
extension FileManager{
    static var documentDirectory:URL{
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! as URL
    }
    
    static var tempDirectory:URL{
        return FileManager.default.temporaryDirectory
    }
    
    static var cachesDirectory:URL{
        return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first! as URL
    }
    
    static func filePathInDocumentsDirectory(fileName:String)->URL{
        return FileManager.documentDirectory.appendingPathComponent(fileName)
    }
    
    static func fileExistsInDocumentDirectory(fileName:String)->Bool{
        let path = filePathInDocumentsDirectory(fileName: fileName).path
        return FileManager.default.fileExists(atPath: path)
    }
    
    static func deleteFileInDocumentsDirectory(fileName:String){
        let path = filePathInDocumentsDirectory(fileName: fileName).path
        do{
            try FileManager.default.removeItem(atPath: path)
            print("FILE: \(path) was deleted!")
        }catch{
            print("ERROR: \(error) - FOR FILE: \(path)")
        }
    }
    
    static func contentsOfDir(url:URL)->[String]{
        do{
            if let paths = try FileManager.default.contentsOfDirectory(atPath: url.path) as [String]?{
                return paths
            }else{
                print("None found")
                return [String]()
            }
        }catch{
            print("ERROR: \(error)")
            return [String]()
        }
    }
    
    static func clearDocumentsFolder(){
        let fileManager = FileManager.default
        let docsFolderPath = FileManager.documentDirectory.path
        do{
            let filePaths = try fileManager.contentsOfDirectory(atPath: docsFolderPath)
            for filePath in filePaths{
                try fileManager.removeItem(atPath: docsFolderPath + "/" + filePath)
            }
            print("Cleared Documents folder")
        }catch{
            print("Could not clear Documents folder: \(error)")
        }
    }
}

extension UIImage{
    func saveImageAsPNG(url:URL){
        let pngData = UIImagePNGRepresentation(self)
        do{
            try pngData?.write(to: url)
        }catch{
            print("ERROR: saving \(url) - error=\(error)")
        }
    }
}
