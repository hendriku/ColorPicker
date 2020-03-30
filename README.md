# ColorPicker

A color picker implementation with color wheel appearance written in plain SwiftUI.

## Usage

Add this repository as a Swift Package Dependency to your project. You find the option in Xcode unter "File > Swift Packages > Add Package Dependency...". Paste the HTTPS reference to this repo and you're done!

After importing the module: Simply use the `ColorPicker` structure which is a regular SwiftUI `View`.

```
import SwiftUI
import ColorPicker

struct ContentView : View {

    @State var color: Color = .red

    var body: some View {
        VStack {
            Text("Source of truth: \(String(describing: color))")
            ColorPicker(color: $color, strokeWidth: 10)
                .frame(width: 100, height: 100, alignment: .center)
        }
    }

}

```

The color wheel will take all the space it can get unless you frame it to a custom size. You are also able to specify the `strokeWidth` of the color wheel over the given property.

## License

You can use this software under the terms and conditions of the MIT License.

Hendrik Ulbrich © 2020
