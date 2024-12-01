//
//  VideoPlayerView.swift
//  Animals
//
//  Created by Evgeniy Borovoy on 12/1/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: - Properties
    var videoTitle: String
    var videoSelected: String
    
    // MARK: - Body
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
            }
            .overlay (
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 16)
                    .padding(.horizontal, 20)
                , alignment: .topLeading
            )
            
        }
        .navigationTitle(videoTitle)
        .toolbarTitleDisplayMode(.inline)
        .accentColor(.accent)
    }
}


#Preview {
    NavigationStack {
        VideoPlayerView(videoTitle: "Lion", videoSelected: "lion")
    }
}
