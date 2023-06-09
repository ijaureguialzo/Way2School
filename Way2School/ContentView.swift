//
//  ContentView.swift
//  Way2School
//
//  Created by Ion Jaureguialzo Sarasola on 21/3/23.
//

import SwiftUI
import Alamofire // Import Alamofire

// Custom Button View
struct IconButton: View {
    let iconName: String
    let labelText: String
    let buttonSize: CGFloat
    let action: () -> Void

    var body: some View {
        VStack {
            Image(systemName: iconName)
                .font(.system(size: 28))
            Text(labelText)
                .font(.system(size: 16))
        }
        .padding()
        .frame(width: buttonSize, height: buttonSize)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
        .onTapGesture {
            action() // Call the action when tapped
        }
    }
}

struct ContentView: View {
    // Button data (SF Symbols icons and labels)
    let buttons = [
        ("figure.walk", "Oinez"),
        ("bicycle", "Bizikleta"),
        ("scooter", "Patinetea"),
        ("car", "Autoa"),
        ("tram.fill", "Trena"),
        ("bus", "Autobusa"),
        ("tram", "Metroa"),
        ("sailboat", "Beste bat"),
    ]

    // Grid layout
    let columns = Array(repeating: GridItem(.flexible()), count: 3)

    // Button size
    let buttonSize: CGFloat = 100

    // Alamofire request function
    func sendRequest(id: Int) {
        let urlString = "https://service/way2school"
        let parameters: Parameters = ["id": id]

        AF.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .response { response in
                switch response.result {
                case .success:
                    print("Request successful")
                case let .failure(error):
                    print("Request failed: \(error.localizedDescription)")
                }
            }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    // Subtitle
                    Text("Nola zatoz eskolara?")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.gray)

                    // Buttons Grid
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(0..<buttons.count, id: \.self) { index in
                            IconButton(iconName: buttons[index].0, labelText: buttons[index].1, buttonSize: buttonSize) {
                                sendRequest(id: index) // Call the sendRequest function when tapped
                            }
                        }
                    }
                }
                .padding() // Apply padding to the VStack
            }
            .navigationTitle("Way2School")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
