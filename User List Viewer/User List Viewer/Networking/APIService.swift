//
//  APIService.swift
//  User List Viewer
//
//  Created by Himanshu on 01/07/25.
//

import Foundation

class APIService {
    static let shared = APIService()
    private init() {}

    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

