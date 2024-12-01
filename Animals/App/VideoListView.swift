//
//  VideoListView.swift
//  Animals
//
//  Created by Evgeniy Borovoy on 11/30/24.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - Properties
    @State private var videos: [Video] = Bundle.main.decode("videos.json")
    
    private let hapticImpacts = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: VideoPlayerView(videoTitle: video.name, videoSelected: video.id)) {
                        VideoListItemView(video: video)
                            .padding(.vertical, 6)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Videos")
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticImpacts.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.trianglehead.2.clockwise")
                            .padding(.horizontal, 8)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        
        VideoListView()
    }
}
