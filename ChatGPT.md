Model: GPT-4

Ion Jaureguialzo Sarasola
switfui view, 3x3 grid of buttons. each button has an icon and a label.
In SwiftUI, you can create a 3x3 grid of buttons with icons and labels by using a combination of LazyVGrid, LazyHGrid, and VStack. Here's an example of how you could implement this layout:

Import SwiftUI and create your custom button view.
Define the button data (icons and labels).
Create a 3x3 grid layout using LazyVGrid and LazyHGrid.
Fill the grid with the custom button views.
swift
Copy code
import SwiftUI

// Custom Button View
struct IconButton: View {
    let iconName: String
    let labelText: String

    var body: some View {
        VStack {
            Image(systemName: iconName)
                .font(.system(size: 28))
            Text(labelText)
                .font(.system(size: 16))
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}

struct ContentView: View {
    // Button data (icons and labels)
    let buttons = [
        ("pencil", "Edit"),
        ("magnifyingglass", "Search"),
        ("square.and.arrow.up", "Share"),
        ("trash", "Delete"),
        ("folder", "Files"),
        ("gear", "Settings"),
        ("person", "Profile"),
        ("plus", "Add"),
        ("questionmark", "Help"),
    ]

    // Grid layout
    let columns = Array(repeating: GridItem(.flexible()), count: 3)

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<buttons.count, id: \.self) { index in
                        IconButton(iconName: buttons[index].0, labelText: buttons[index].1)
                    }
                }
                .padding()
            }
            .navigationTitle("Button Grid")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
In this example, I've created a custom button view called IconButton with an icon and a label. The buttons array contains the names of the SF Symbols and their corresponding labels. The columns array and LazyVGrid are used to create a 3x3 grid layout, and the ForEach loop iterates over the buttons array to populate the grid with the custom button views.



Ion Jaureguialzo Sarasola
Add a big title label which says "Way2School" on top
You can add a big title label on top of the grid by simply adding a Text view with a custom font and padding above the LazyVGrid in a VStack. Here's the modified ContentView:

swift
Copy code
import SwiftUI

// Custom Button View
struct IconButton: View {
    let iconName: String
    let labelText: String

    var body: some View {
        VStack {
            Image(systemName: iconName)
                .font(.system(size: 28))
            Text(labelText)
                .font(.system(size: 16))
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}

struct ContentView: View {
    // Button data (icons and labels)
    let buttons = [
        ("pencil", "Edit"),
        ("magnifyingglass", "Search"),
        ("square.and.arrow.up", "Share"),
        ("trash", "Delete"),
        ("folder", "Files"),
        ("gear", "Settings"),
        ("person", "Profile"),
        ("plus", "Add"),
        ("questionmark", "Help"),
    ]

    // Grid layout
    let columns = Array(repeating: GridItem(.flexible()), count: 3)

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Big title label
                    Text("Way2School")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .padding(.bottom)

                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(0..<buttons.count, id: \.self) { index in
                            IconButton(iconName: buttons[index].0, labelText: buttons[index].1)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Button Grid")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
In this updated version, I've added a Text view with the "Way2School" title inside a VStack. The font size is set to 36, the weight to bold, and the design to rounded. The VStack contains both the title label and the LazyVGrid with the button grid.



Ion Jaureguialzo Sarasola
Make all buttons square and of the same size. 
To make all buttons square and of the same size, you can set a fixed frame size for the IconButton view. Here's the modified IconButton and ContentView:

swift
Copy code
import SwiftUI

// Custom Button View
struct IconButton: View {
    let iconName: String
    let labelText: String
    let buttonSize: CGFloat

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
    }
}

struct ContentView: View {
    // Button data (icons and labels)
    let buttons = [
        ("pencil", "Edit"),
        ("magnifyingglass", "Search"),
        ("square.and.arrow.up", "Share"),
        ("trash", "Delete"),
        ("folder", "Files"),
        ("gear", "Settings"),
        ("person", "Profile"),
        ("plus", "Add"),
        ("questionmark", "Help"),
    ]

    // Grid layout
    let columns = Array(repeating: GridItem(.flexible()), count: 3)

    // Button size
    let buttonSize: CGFloat = 100

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Big title label
                    Text("Way2School")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .padding(.bottom)

                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(0..<buttons.count, id: \.self) { index in
                            IconButton(iconName: buttons[index].0, labelText: buttons[index].1, buttonSize: buttonSize)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Button Grid")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
In this updated version, I've added a new constant called buttonSize inside the ContentView, and it's set to 100. The IconButton view now takes an additional parameter, buttonSize, which is used to set a fixed width and height in the .frame() modifier. This change ensures that all buttons have the same square size.



Ion Jaureguialzo Sarasola
Delete the big title label and set the navigation title to "Way2School"
To remove the big title label and set the navigation title to "Way2School", you can simply remove the Text view containing the title and update the .navigationTitle() modifier accordingly. Here's the modified ContentView:

swift
Copy code
import SwiftUI

// Custom Button View
struct IconButton: View {
    let iconName: String
    let labelText: String
    let buttonSize: CGFloat

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
    }
}

struct ContentView: View {
    // Button data (icons and labels)
    let buttons = [
        ("pencil", "Edit"),
        ("magnifyingglass", "Search"),
        ("square.and.arrow.up", "Share"),
        ("trash", "Delete"),
        ("folder", "Files"),
        ("gear", "Settings"),
        ("person", "Profile"),
        ("plus", "Add"),
        ("questionmark", "Help"),
    ]

    // Grid layout
    let columns = Array(repeating: GridItem(.flexible()), count: 3)

    // Button size
    let buttonSize: CGFloat = 100

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<buttons.count, id: \.self) { index in
                        IconButton(iconName: buttons[index].0, labelText: buttons[index].1, buttonSize: buttonSize)
                    }
                }
                .padding()
            }
            .navigationTitle("Way2School") // Updated navigation title
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
I've removed the Text view with the "Way2School" title and updated the .navigationTitle() modifier to have the "Way2School" text. Now, the navigation title displays "Way2School" as requested.



Ion Jaureguialzo Sarasola
replace the icons with those, in order: person walking, bike, motorbike, car, train, electric scooter, bus, subway, hot air balloon
As the custom icons you provided are not part of the default SF Symbols, you will need to use custom images for these icons. To do this, add your custom images to your project's Assets.xcassets folder and replace the system names in the buttons array with the names of your custom images.

Here's the modified ContentView with updated icon names:

swift
Copy code
import SwiftUI

// Custom Button View
struct IconButton: View {
    let iconName: String
    let labelText: String
    let buttonSize: CGFloat

    var body: some View {
        VStack {
            Image(iconName) // Changed from Image(systemName:)
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            Text(labelText)
                .font(.system(size: 16))
        }
        .padding()
        .frame(width: buttonSize, height: buttonSize)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}

struct ContentView: View {
    // Button data (custom icons and labels)
    let buttons = [
        ("person_walking", "Walking"),
        ("bike", "Bike"),
        ("motorbike", "Motorbike"),
        ("car", "Car"),
        ("train", "Train"),
        ("electric_scooter", "Scooter"),
        ("bus", "Bus"),
        ("subway", "Subway"),
        ("hot_air_balloon", "Balloon"),
    ]

    // Grid layout
    let columns = Array(repeating: GridItem(.flexible()), count: 3)

    // Button size
    let buttonSize: CGFloat = 100

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<buttons.count, id: \.self) { index in
                        IconButton(iconName: buttons[index].0, labelText: buttons[index].1, buttonSize: buttonSize)
                    }
                }
                .padding()
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
In this modified version, I've updated the buttons array with the custom icon names, and I've changed the Image view in the IconButton struct to use the custom icon names instead of the SF Symbols. Also, I've added .resizable(), .scaledToFit(), and .frame(height: 28) modifiers to the Image view to scale and size the custom images properly.

Make sure to add your custom images to your project's Assets.xcassets folder with the names provided in the buttons array (person_walking, bike, motorbike, car, train, electric_scooter, bus, subway, hot_air_balloon).



Ion Jaureguialzo Sarasola
try to match the requested icons to those available on sf symbols. use only sf symbols.
To match the requested icons to those available in SF Symbols, you can use the following SF Symbols as an approximation:

person walking - figure.walk
bike - bicycle
motorbike - scooter
car - car
train - tram.fill
electric scooter - wheelchair
bus - bus
subway - tram
hot air balloon - shippingbox.fill (since there is no hot air balloon icon, I used a shipping box as an alternative)
Here's the modified ContentView with updated SF Symbols:

swift
Copy code
import SwiftUI

// Custom Button View
struct IconButton: View {
    let iconName: String
    let labelText: String
    let buttonSize: CGFloat

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
    }
}

struct ContentView: View {
    // Button data (SF Symbols icons and labels)
    let buttons = [
        ("figure.walk", "Walking"),
        ("bicycle", "Bike"),
        ("scooter", "Motorbike"),
        ("car", "Car"),
        ("tram.fill", "Train"),
        ("wheelchair", "Scooter"),
        ("bus", "Bus"),
        ("tram", "Subway"),
        ("shippingbox.fill", "Balloon"), // Alternative for hot air balloon
    ]

    // Grid layout
    let columns = Array(repeating: GridItem(.flexible()), count: 3)

    // Button size
    let buttonSize: CGFloat = 100

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<buttons.count, id: \.self) { index in
                        IconButton(iconName: buttons[index].0, labelText: buttons[index].1, buttonSize: buttonSize)
                    }
                }
                .padding()
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
In this modified version, I've updated the buttons array with the closest matching SF Symbols for the requested icons.



Ion Jaureguialzo Sarasola
make buttons tappable. when each button is pressed, a request with be made to a web service located in https://service/way2school. it's a restful service. use the alamofire library.
To make the buttons tappable and send a request using the Alamofire library when a button is pressed, follow these steps:

Install Alamofire by adding it to your project's Swift Package Manager or by using CocoaPods or Carthage.
Import Alamofire in your ContentView.swift file.
Create a function to handle the button tap and send a request using Alamofire.
Add a tap action to the IconButton view in ContentView.
Here's the modified ContentView with the Alamofire request and tap action added:

swift
Copy code
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
        ("figure.walk", "Walking"),
        ("bicycle", "Bike"),
        ("scooter", "Motorbike"),
        ("car", "Car"),
        ("tram.fill", "Train"),
        ("wheelchair", "Scooter"),
        ("bus", "Bus"),
        ("tram", "Subway"),
        ("shippingbox.fill", "Balloon"),
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
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<buttons.count, id: \.self) { index in
                        IconButton(iconName: buttons[index].0, labelText: buttons[index].1, buttonSize: buttonSize) {
                            sendRequest(id: index) // Call the sendRequest function when tapped
                        }
                    }
                }
                .padding()
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
In this modified version, I've added a function called sendRequest that takes an integer id as a parameter. This function sends a POST request to the specified URL using Alamofire, with a parameter containing the id. The IconButton view now takes an additional action parameter, which is a closure that will be called when the button is tapped.

In the ContentView body, I've added the sendRequest function call within the action closure of the IconButton view, passing the current index as the id. This will send a request to the specified web service when a button is tapped.

Make sure you have Alamofire installed in your project before running



Ion Jaureguialzo Sarasola
Add a subtitle that says "Nola zatoz eskolara?" to this: import SwiftUI
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
        ("figure.walk", "Walking"),
        ("bicycle", "Bike"),
        ("scooter", "Scooter"),
        ("car", "Car"),
        ("tram.fill", "Train"),
        ("bus", "Bus"),
        ("tram", "Subway"),
        ("sailboat", "Other"),
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
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<buttons.count, id: \.self) { index in
                        IconButton(iconName: buttons[index].0, labelText: buttons[index].1, buttonSize: buttonSize) {
                            sendRequest(id: index) // Call the sendRequest function when tapped
                        }
                    }
                }
                .padding()
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
To add a subtitle "Nola zatoz eskolara?" below the navigation title, you can use the .toolbar modifier with a ToolbarItem of placement .principal. Here's the modified ContentView with the subtitle added:

swift
Copy code
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
        ("figure.walk", "Walking"),
        ("bicycle", "Bike"),
        ("scooter", "Scooter"),
        ("car", "Car"),
        ("tram.fill", "Train"),
        ("bus", "Bus"),
        ("tram", "Subway"),
        ("sailboat", "Other"),
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
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<buttons.count, id: \.self) { index in
                        IconButton(iconName: buttons[index].0, labelText: buttons[index].1, buttonSize: buttonSize) {
                            sendRequest(id: index) // Call the sendRequest function when tapped
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Way2School")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Way2School")
                            .font(.headline)
                        Text("Nola zatoz eskolara?")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
In this modified version, I've added the .toolbar modifier with a ToolbarItem of placement .principal containing a VStack with the main title "Way2School" and the subtitle "Nola zatoz eskolara?". This will display the subtitle below the navigation title as requested.



Ion Jaureguialzo Sarasola
don't put it in a toolbar, put it below the navigation title and before the buttons, in medium sized gray font
To add the subtitle "Nola zatoz eskolara?" below the navigation title and before the buttons, you can simply place a Text view inside the ScrollView before the LazyVGrid. Here's the modified ContentView:

swift
Copy code
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
        ("figure.walk", "Walking"),
        ("bicycle", "Bike"),
        ("scooter", "Scooter"),
        ("car", "Car"),
        ("tram.fill", "Train"),
        ("bus", "Bus"),
        ("tram", "Subway"),
        ("sailboat", "Other"),
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
                // Subtitle
                Text("Nola zatoz eskolara?")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.gray)
                    .padding(.bottom)

                // Buttons Grid
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<buttons.count, id: \.self) { index in
                        IconButton(iconName: buttons[index].0, labelText: buttons[index].1, buttonSize: buttonSize) {
                            sendRequest(id: index) // Call the sendRequest function when tapped
                        }
                    }
                }
                .padding()
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
In this modified version, I've added a Text view with the subtitle "Nola zatoz eskolara?" inside the ScrollView before the LazyVGrid. The subtitle is displayed in a medium-sized gray font below the navigation title and before the buttons.



Ion Jaureguialzo Sarasola
Align the subtitle to the left.
To align the subtitle "Nola zatoz eskolara?" to the left, you can add the .frame modifier with the alignment parameter set to .leading. Here's the modified ContentView:

swift
Copy code
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
        ("figure.walk", "Walking"),
        ("bicycle", "Bike"),
        ("scooter", "Scooter"),
        ("car", "Car"),
        ("tram.fill", "Train"),
        ("bus", "Bus"),
        ("tram", "Subway"),
        ("sailboat", "Other"),
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
                // Subtitle
                Text("Nola zatoz eskolara?")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading) // Align the subtitle to the left
                    .padding(.bottom)

                // Buttons Grid
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<buttons.count, id: \.self) { index in
                        IconButton(iconName: buttons[index].0, labelText: buttons[index].1, buttonSize: buttonSize) {
                            sendRequest(id: index) // Call the sendRequest function when tapped
                        }
                    }
                }
                .padding()
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
In this modified version, I've added the .frame(maxWidth: .infinity, alignment: .leading) modifier to the subtitle Text view to align it to the left.




Regenerate response

New chat
History is temporarily unavailable. We're working to restore this feature as soon as possible.
Dark mode
My account
Updates & FAQ
Log out
New chat
