import SwiftUI

// Draws Rectangle with Xs
struct RectangleGrid: View {
    let width: Int
    let height: Int
    
    var body: some View {
        VStack() {  // Rows
            ForEach(0..<height, id: \.self) { row in
                HStack() {  // Columns
                    ForEach(0..<width, id: \.self) { column in
                        Text("X")
                            .background(.blue)
                    }
                }
            }
        }
        .padding()
    }
}

struct GridView: View {
    // State Variables for input fields
    @State private var widthInput: String = ""
    @State private var heightInput: String = ""

    // Binding Variables for width and height
    @Binding var width: Int
    @Binding var height: Int
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {

                    // Update Height
                    HStack{
                        Text("Height: ")
                        TextField("Height", text: $heightInput)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .frame(width: 200)
                    }

                    // Update Width
                    HStack{
                        Text("Width: ")
                        TextField("Width", text: $widthInput)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .frame(width: 200)
                    }
                    // Update Button
                    Button("Update") {
                        if let newWidth = Int(widthInput),
                           let newHeight = Int(heightInput) {
                            width = newWidth
                            height = newHeight
                        }
                    }.background(.gray)
                }.padding()

                RectangleGrid(width: width, height: height)
            }
        }
        .navigationTitle("")

        // Set starting values for text input (For width and height)
        .onAppear {
            widthInput = String(width)
            heightInput = String(height)
        }
    }
}
#Preview {
    ContentView()
}
