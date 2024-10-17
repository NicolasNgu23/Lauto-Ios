//  DataController.swift
//  projetRendu
//
//  Created by NGUYEN Nicolas on 15/10/2024.
//
import Foundation

class DataController {
    struct User {
        let username: String
        let password: String
        var credits: Int
    }
    
    static let registeredUsers: [User] = [
        User(username: "Jean", password: "1234", credits: 10),
        User(username: "Anne", password: "0000", credits: 10),
        User(username: "Nico", password: "1111", credits: 10)
    ]
    
    struct Car: Identifiable {
        let id: Int
        let name: String
        let image: String
        let description: String
        let ticketPrice: String
        let power: String
        let gearbox: String
        let mileage: String
        let year: Int
        let color: String
        let fuelType: String
        var participants: [String] = []
        var drawDate: String
    }

    static func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        return dateFormatter.string(from: date)
    }

    static let nextDrawDate: Date = {
        Calendar.current.nextDate(after: Date(), matching: DateComponents(weekday: 1), matchingPolicy: .nextTime)!
    }()

    static var cars: [Car] = [
        Car(id: 1, name: "BMW M5 compétition", image: "bmwM5", description: "La berline sportive par excellence.", ticketPrice: "6", power: "600 CV", gearbox: "Automatique", mileage: "8,000 km", year: 2022, color: "Gris", fuelType: "Essence", drawDate: "16/10/24"),
        Car(id: 2, name: "Audi RS3", image: "Audirs3", description: "Performance et luxe réunis.", ticketPrice: "4", power: "400 CV", gearbox: "Automatique", mileage: "5,000 km", year: 2023, color: "Vert", fuelType: "Essence", drawDate: formatDate(nextDrawDate)),
        Car(id: 3, name: "Mercedes-AMG C 63", image: "CLE53", description: "Puissance et raffinement.", ticketPrice: "6", power: "476 CV", gearbox: "Automatique", mileage: "10,000 km", year: 2021, color: "Noir", fuelType: "Essence", drawDate: formatDate(nextDrawDate)),
        Car(id: 4, name: "Golf 8 R-line", image: "Golf8", description: "La nouvelle Golf, un classique moderne.", ticketPrice: "3", power: "110 CV", gearbox: "Automatique", mileage: "15,000 km", year: 2022, color: "Bleu", fuelType: "Essence", drawDate: formatDate(nextDrawDate)),
    ]
    
    static func authenticateUser(username: String, password: String) -> Bool {
        return registeredUsers.contains { $0.username == username && $0.password == password }
    }
}
