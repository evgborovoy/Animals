//
//  VideoListItemView.swift
//  Animals
//
//  Created by Evgeniy Borovoy on 12/1/24.
//

import SwiftUI

struct VideoListItemView: View {
    // MARK: - Properties
    let video: Video
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                    .shadow(radius: 4)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            Spacer()
        }
    }
}

#Preview {
    let videos: [Video] = Bundle.main.decode("videos.json")
    VideoListItemView(video: videos.first!)
}
