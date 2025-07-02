//
//  UserListView.swift
//  User List Viewer
//
//  Created by Himanshu on 01/07/25.
//

import SwiftUI

struct UserListView: View {
    @StateObject private var viewModel = UserListViewModel()
    @State private var showErrorOverlay = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Group {
                    if viewModel.isLoading {
                        ProgressView("Loading...")
                    } else {
                        List(viewModel.users) { user in
                            NavigationLink(destination: UserDetailView(user:user)) {
                                UserRowView(user: user)
                            }
                        }
                        .refreshable {
                            viewModel.fetchUsers()
                        }
                    }
                }
                .blur(radius: showErrorOverlay ? 5 : 0)
                if showErrorOverlay, let error = viewModel.errorMessage {
                    ErrorView(message: error) {
                        viewModel.fetchUsers()
                        showErrorOverlay = false
                    }
                    
                }
            }
            .navigationTitle("User List Viewer")
            .navigationBarTitleDisplayMode(.automatic)
        }
        .onAppear {
            viewModel.fetchUsers()
        }
        
        .onChange(of: viewModel.errorMessage) { newError in
            showErrorOverlay = newError != nil
        }
    }
}
