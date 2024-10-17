//
//  ContentView.swift
//  projetRendu
//
//  Created by NGUYEN Nicolas on 15/10/2024.
//
import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    @State var username: String = ""
    @State var password: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                Image("logoios")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 150, height: 25)
                  .foregroundStyle(.tint)
                  .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.pink, .purple, .blue,]), startPoint: .leading, endPoint: .trailing))

                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button(action: {
                        viewModel.checkConnection(username: username, password: password)
                    }) {
                        Text("Connexion")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(5)
                    }
                .padding()
                .cornerRadius(10)
            }
            .padding()
            .navigationDestination(isPresented: $viewModel.isLoggedIn) {
                MenuAppView(username: username)
            }
        }
    }
}


#Preview {
    MainView()
}
