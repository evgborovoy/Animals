//
//  VideoPlayerUtility.swift
//  Animals
//
//  Created by Evgeniy Borovoy on 12/1/24.
//

import Foundation
import AVKit



func playVideo(fileName: String, fileFormat: String) -> AVPlayer? {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) else {
        print("Видео \(fileName).\(fileFormat) не найдено.")
        return nil
    }
    let videoPlayer = AVPlayer(url: url)
    videoPlayer.play()
    return videoPlayer
}


