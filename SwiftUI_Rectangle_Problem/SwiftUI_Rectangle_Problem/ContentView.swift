//
//  ContentView.swift
//  SwiftUI_Rectangle_Problem
//
//  Created by Andy Do on 12/19/24.
//

import SwiftUI

struct Rectangle: Identifiable, Hashable {
    let id = UUID()
    var width: Int
    var height: Int
}

struct ContentView: View {
    // State Variables for input fields and rectangles
    @State private var widthInput: String = ""
    @State private var heightInput: String = ""
    @State private var rectangles: [Rectangle] = []
    
    var body: some View {
        NavigationView {
            // list of rectangles
            List {
                ForEach(Array(rectangles.enumerated()), id: \.element.id) { index, rectangle in
                    // Navigation link to GridView
                    NavigationLink(destination: GridView(
                        width: Binding(
                            get: { rectangles[index].width },
                            set: { rectangles[index].width = $0 }
                        ),
                        height: Binding(
                            get: { rectangles[index].height },
                            set: { rectangles[index].height = $0 }
                        )
                    )) {
                        Text("Height: \(rectangle.height); Width: \(rectangle.width)")
                    }
                }
            }
            .navigationTitle("Summary")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    // Add new rectangle
                    HStack {
                
                        TextField("Height", text: $heightInput)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                            
                        TextField("Width", text: $widthInput)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                    
                        Button("Add") {
                            if let width = Int(widthInput),
                               let height = Int(heightInput) {
                                rectangles.append(Rectangle(width: width, height: height))
                                widthInput = ""
                                heightInput = ""
                            }
                        }.background(.gray)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
