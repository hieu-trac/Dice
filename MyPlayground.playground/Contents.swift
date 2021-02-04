//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

enum Constants {
    enum Face {
        static let length = CGFloat(120.0)
        static let cornerRadius = CGFloat(10.0)
        static let color = Color.white
    }
    enum Pip {
        static let radius = CGFloat(20.0)
        static let color = Color.black
    }
}

struct FaceShape: View {
    var body: some View {
        RoundedRectangle(cornerRadius: Constants.Face.cornerRadius)
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
        ZStack(alignment: .center) {
            FaceShape()
            Pip()
        }
    }
}

struct FaceTwoView: View {
    var body: some View {
        ZStack(alignment: .center) {
            FaceShape()
            VStack {
                HStack {
                    Pip()
                }
                HStack {
                    Pip()
                }
            }
        }
    }
}

struct ContentView : View {
    var body: some View {
        HStack {
            Spacer()
            FaceOneView()
            Spacer()
            FaceTwoView()
            Spacer()
        }
        .frame(width: 6.0 * Constants.Face.length, height: Constants.Face.length)
    }
}

PlaygroundPage.current.setLiveView(ContentView())
