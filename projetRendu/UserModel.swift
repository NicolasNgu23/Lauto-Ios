//
//  UserModel.swift
//  projetRendu
//
//  Created by Nicolas Nguyen on 17/10/2024.
//

import Foundation

class UserModel: ObservableObject {
    @Published var currentUser: DataController.User?
    
    func logIn(username: String, password: String) {
        if let user = DataController.registeredUsers.first(where: { $0.username == username && $0.password == password }) {
            self.currentUser = user
        } else {
            self.currentUser = nil
        }
    }
    
    func logOut() {
        self.currentUser = nil
    }
}
