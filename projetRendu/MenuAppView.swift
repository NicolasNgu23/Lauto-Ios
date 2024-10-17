//
//  MenuAppView.swift
//  projetRendu
//
//  Created by NGUYEN Nicolas on 15/10/2024.
//
import SwiftUI

struct MenuAppView: View {
    @StateObject var viewModel = MainViewModel()
    var username: String

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Découvrez nos véhicules de rêve")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.pink, .purple, .blue,]), startPoint: .leading, endPoint: .trailing))

                    ForEach(DataController.cars) { car in
                        VStack(alignment: .leading) {
                            Image(car.image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipped()
                                .cornerRadius(10)

                            HStack {
                                Text(car.name)
                                    .font(.title2)
                                    .bold()
                                    .padding(.top, 5)

                                Spacer()

                                Text("\(car.ticketPrice)€")
                                    .padding()
                                    .background(Color.black.opacity(0.92))
                                    .foregroundColor(.white)
                                    .cornerRadius(40)
                                    .padding(.top, 1)
                            }

                            Text(car.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.bottom, 5)

                            HStack {
                                NavigationLink(destination: CarDetailView(carId: car.id, viewModel: viewModel, username: username)) {
                                    Text("Tenter ma chance")
                                    Image(systemName: "cart")
                                }
                                .padding(10)
                                .foregroundColor(.white)
                                .background(Color.black.opacity(0.92))
                                .cornerRadius(5)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("LAUTO")
        }
    }
}

struct CarDetailView: View {
    let carId: Int
    @State private var selectedCar: DataController.Car? = nil
    @State private var showAlert = false
    @State private var alertMessage = ""
    @StateObject var viewModel = MainViewModel()
    @State private var winnerName: String? = nil
    var username: String

    var body: some View {
        VStack {
            if let car = DataController.cars.first(where: { $0.id == carId }) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(car.name)
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(2)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.pink, .purple, .blue]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10)

                    Image(car.image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(10)

                    HStack {
                        Button(action: {
                            viewModel.addParticipant(username: username, carName: car.name)
                            alertMessage = "Vous avez participé au tirage!"
                            showAlert = true
                        }) {
                            HStack {
                                Image(systemName: "gamecontroller.fill")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text("Entrer dans le jeu pour \(car.ticketPrice)€")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text("Fin du jeu le \(car.drawDate)")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .background(Color.black.opacity(0.90))
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Participants:")
                                .font(.headline)

                            if car.participants.isEmpty {
                                Text("Aucun participant pour le moment.")
                                    .foregroundColor(.gray)
                            } else {
                                ForEach(car.participants, id: \.self) { participant in
                                    Text(participant)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .padding()
                        .background(Color.black.opacity(0.90))
                        .cornerRadius(10)
                        .foregroundColor(.white)

                        Spacer()
                       
                        Button(action: {
                            let winner = viewModel.getWinner(carName: car.name)
                            winnerName = winner
                        }) {
                            HStack {
                                Image(systemName: "trophy")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(winnerName ?? "Découvrir le Gagnant !")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                        .background(Color.black.opacity(0.90))
                        .cornerRadius(10)
                    }

                    VStack(alignment: .leading) {
                        Text(car.description)
                            .font(.title)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .multilineTextAlignment(.center)
                    }
                    .padding()

                    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
                    LazyVGrid(columns: gridItems, alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "paintbrush")
                            Text(": \(car.color)")
                        }
                        HStack {
                            Image(systemName: "fuelpump")
                            Text(": \(car.fuelType)")
                        }
                        HStack {
                            Image(systemName: "speedometer")
                            Text(": \(car.mileage)")
                        }
                        HStack {
                            Image(systemName: "calendar")
                            Text(": \(car.year)")
                        }
                        HStack {
                            Image(systemName: "bolt.fill")
                            Text(": \(car.power)")
                        }
                        HStack {
                            Image(systemName: "gear")
                            Text(": \(car.gearbox)")
                        }
                    }
                    .padding()
                    .background(Color.black.opacity(0.90))
                    .cornerRadius(10)
                    .padding(.top, 10)
                    .foregroundColor(.white)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Notification"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            } else {
                Text("Voiture non trouvée")
            }
        }
        .padding()
        .navigationTitle("Détails de la voiture")
    }
}

#Preview {
    MenuAppView(username: "Nico")
}
