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
        Car(id: 5, name: "Ferrari SF90 Stradale", image: "ferrariSF90", description: "La supercar hybride avec une technologie de pointe.", ticketPrice: "10", power: "1000 CV", gearbox: "Automatique", mileage: "1,000 km", year: 2023, color: "Rouge", fuelType: "Hybride", drawDate: formatDate(nextDrawDate)),
            Car(id: 6, name: "Lamborghini Aventador SVJ", image: "lamborghiniAventador", description: "La performance extrême, l'incarnation du luxe et de la puissance.", ticketPrice: "12", power: "770 CV", gearbox: "Automatique", mileage: "2,000 km", year: 2022, color: "Jaune", fuelType: "Essence", drawDate: formatDate(nextDrawDate)),
            Car(id: 7, name: "Bentley Continental GT", image: "bentleyContinental", description: "Une combinaison de performance et de grand luxe.", ticketPrice: "9", power: "626 CV", gearbox: "Automatique", mileage: "7,000 km", year: 2022, color: "Noir", fuelType: "Essence", drawDate: formatDate(nextDrawDate)),
            Car(id: 8, name: "Rolls-Royce Ghost", image: "rollsRoyceGhost", description: "La quintessence de la sophistication et de l'élégance.", ticketPrice: "15", power: "563 CV", gearbox: "Automatique", mileage: "3,000 km", year: 2023, color: "Blanc", fuelType: "Essence", drawDate: formatDate(nextDrawDate)),
            Car(id: 9, name: "Porsche Taycan Turbo S", image: "porscheTaycan", description: "Performance électrique et design iconique.", ticketPrice: "8", power: "750 CV", gearbox: "Automatique", mileage: "4,000 km", year: 2023, color: "Bleu", fuelType: "Électrique", drawDate: formatDate(nextDrawDate)),
            Car(id: 10, name: "Aston Martin DBS Superleggera", image: "astonMartinDBS", description: "L'art du grand tourisme, une puissance époustouflante.", ticketPrice: "10", power: "715 CV", gearbox: "Automatique", mileage: "6,000 km", year: 2022, color: "Vert", fuelType: "Essence", drawDate: formatDate(nextDrawDate)),
            Car(id: 11, name: "Bugatti Chiron", image: "bugattiChiron", description: "L'une des voitures les plus rapides et luxueuses au monde.", ticketPrice: "20", power: "1500 CV", gearbox: "Automatique", mileage: "500 km", year: 2023, color: "Bleu", fuelType: "Essence", drawDate: formatDate(nextDrawDate)),
            Car(id: 12, name: "McLaren 720S", image: "mclaren720S", description: "Une machine de course conçue pour la route.", ticketPrice: "11", power: "710 CV", gearbox: "Automatique", mileage: "3,500 km", year: 2023, color: "Orange", fuelType: "Essence", drawDate: formatDate(nextDrawDate))
    ]
    
    static func authenticateUser(username: String, password: String) -> Bool {
        return registeredUsers.contains { $0.username == username && $0.password == password }
    }
}
