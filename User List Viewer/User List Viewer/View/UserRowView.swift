//
//  UserRowView.swift
//  User List Viewer
//
//  Created by Himanshu on 01/07/25.
//

import SwiftUI

struct UserRowView: View {
    let user: User
    
    var body: some View {
        HStack {
            UserProfileImageView(userID: user.id, size: 50)
            
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.headline)
                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

