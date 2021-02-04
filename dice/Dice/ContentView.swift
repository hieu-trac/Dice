//
//  ContentView.swift
//  dice
//
//  Created by Hieu C Trac on 2/1/21.
//

import SwiftUI

enum Constants {
    enum Face {
        static let length = CGFloat(120.0)
        static let cornerRadius = CGFloat(10.0)
        static let color = Color.white
        static let borderColor = Color.black
        static let borderWidth = CGFloat(1.0)
    }
    enum Pip {
        static let radius = CGFloat(20.0)
        static let color = Color.black
    }
}

struct FaceShape: View {
    var body: some View {
        RoundedRectangle(cornerRadius: Constants.Face.cornerRadius)
            .strokeBorder(Constants.Face.borderColor, lineWidth: Constants.Face.borderWidth)
            .frame(width: Constants.Face.length, height: Constants.Face.length)
            .foregroundColor(Constants.Face.color)
    }
}

struct Pip: View {
    var body: some View {
        Circle()
            .fill(Constants.Pip.color)
            .frame(width: Constants.Pip.radius, height: Constants.Pip.radius)
    }
}

struct FaceOneView: View {
    var body: some View {
        FaceShape()
            .overlay(Pip())
    }
}

struct FaceTwoView: View {
    var body: some View {
        FaceShape()
            .overlay(
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Pip()
                    }
                    .padding()
                    Spacer()
                    HStack {
                        Pip()
                        Spacer()
                    }
                    .padding()
                    Spacer()
                }
            )
    }
}

struct FaceThreeView: View {
    var body: some View {
        FaceTwoView()
            .overlay(Pip())
    }
}

struct FaceFourView: View {
    var body: some View {
        FaceShape()
            .overlay(
                VStack {
                    Spacer()
                    HStack {
                        Pip()
                        Spacer()
                        Pip()
                    }
                    .padding()
                    Spacer()
                    HStack {
                        Pip()
                        Spacer()
                        Pip()
                    }
                    .padding()
                    Spacer()
                }
            )
    }
}

struct FaceFiveView: View {
    var body: some View {
        FaceFourView()
            .overlay(Pip())
    }
}

struct FaceSixView: View {
    var body: some View {
        FaceFourView()
            .overlay(
                HStack {
                    Pip()
                    Spacer()
                    Pip()
                }
                .padding()
            )
    }
}

struct ContentView : View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                //Spacer()
                FaceOneView()
                //Spacer()
                FaceTwoView()
                //Spacer()
                FaceThreeView()
                //Spacer()
            }
            //.padding()
            HStack(spacing: 0) {
                //Spacer()
                FaceFourView()
                //Spacer()
                FaceFiveView()
                //Spacer()
                FaceSixView()
                //Spacer()
            }
            //.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
