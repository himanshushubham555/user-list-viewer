//
//  UserProfileImageView.swift
//  User List Viewer
//
//  Created by Himanshu on 01/07/25.
//

import SwiftUI

struct UserProfileImageView: View {
    let userID: Int
    let size: CGFloat

    var body: some View {
        AsyncImage(url: URL(string: "https://i.pravatar.cc/150?img=\(userID)")) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: size, height: size)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .clipShape(Circle())
            case .failure:
                Image(systemName: "person.crop.circle.badge.exclamationmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
    }
}
