//
//  UserDetailsView.swift
//  User List Viewer
//
//  Created by Himanshu on 01/07/25.
//


import SwiftUI
import PDFKit

struct UserDetailView: View {
//    @ObservedObject var viewModel: UserDetailViewModel
    var user: User

    @State private var showResume = false

    var body: some View {
        VStack {
            // Card
            VStack(spacing: 20) {
                UserProfileImageView(userID: user.id, size: 100)
                Text(user.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)

                VStack(alignment: .leading, spacing: 16) {
                    detailItem(title: "Phone", value: user.phone, icon: "phone.fill")
                    Divider()
                    detailItem(title: "Address", value: fullAddress(), icon: "house.fill")
                    Divider()
                    detailItem(title: "Company", value: user.company.name, icon: "briefcase.fill")
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.blue.opacity(0.1))
                    .shadow(color: Color.blue.opacity(0.2), radius: 10, x: 0, y: 5)
            )
            .padding(.horizontal)

            Spacer()

            // Footer
            HStack(spacing: 4) {
                Text("Made with ❤️ by")
                    Text("Himanshu")
                        .underline()
                        .foregroundColor(.blue)
                        .fontWeight(.semibold)
                        .onTapGesture {
                            showResume = true
                        }
            }
            .font(.footnote)
            .padding(.bottom, 10)
            .sheet(isPresented: $showResume) {
                ResumeView()
            }

        }
        .navigationTitle("User Details")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func detailItem(title: String, value: String, icon: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 24)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.blue)
                Text(value)
                    .font(.body)
                    .foregroundColor(.primary)
            }
        }
    }
    
    private func fullAddress() -> String {
        "\(user.address.street), \(user.address.suite), \(user.address.city), \(user.address.zipcode) "
    }
}

//#Preview {
//    UserDetailView()
//}
