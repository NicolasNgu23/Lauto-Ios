//  MainViewModel.swift
//  projetRendu
//
//  Created by NGUYEN Nicolas on 15/10/2024.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String? = nil
    @Published var statusMessage: String? = nil
    var currentUser: DataController.User?
    
    func checkConnection(username: String, password: String) {
        if let user = DataController.registeredUsers.first(where: { $0.username == username }) {
            if user.password == password {
                isLoggedIn = true
                errorMessage = nil
                currentUser = user
            } else {
                isLoggedIn = false
                errorMessage = "Le mot de passe est incorrect."
            }
        } else {
            isLoggedIn = false
            errorMessage = "Le nom d'utilisateur est incorrect."
        }
    }
    
    func addParticipant(username: String, carName: String) {
        if let car = DataController.cars.first(where: { $0.name == carName }) {
            print(car.name)
            if let user = DataController.registeredUsers.first(where: { $0.username == username }) {
                if user.credits >= Int(car.ticketPrice) ?? 0{
                    if let index = getIndexCar(id: car.id) {
                        DataController.cars[index].participants.append(user.username)
                        print(username)
                        print(user.credits)
                    }
                }
            }
        }
    }
    private func getIndexCar(id: Int) -> Int? {
        for (index, car) in DataController.cars.enumerated() where car.id == id {
            return index
        }
        return nil
    }
    
    func getWinner(carName: String) -> String {
        if let car = DataController.cars.first(where: { $0.name == carName }) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yy"
            if let drawDate = dateFormatter.date(from: car.drawDate) {
                let currentDate = Date()
                
                if currentDate >= drawDate {
                    if !car.participants.isEmpty {
                        let randomIndex = Int.random(in: 0..<car.participants.count)
                        return car.participants[randomIndex]
                    } else {
                        return "Aucun participant"
                    }
                } else {
                    return "Les participations ne sont pas encore terminé"
                }
            }
        }
        return "Voiture non trouvée"
    }
}
