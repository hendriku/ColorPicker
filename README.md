# ColorPickerRing

A color picker implementation with color wheel appearance written in plain SwiftUI. It is compatible with UIColor and NSColor.

![ColorPickerDemo-2](https://user-images.githubusercontent.com/8998518/78367183-f6531780-75c1-11ea-8829-f288241c0d49.gif)

## Usage

Add this repository as a Swift Package Dependency to your project. You find the option in Xcode unter "File > Swift Packages > Add Package Dependency...". Paste the HTTPS reference to this repo and you're done!

After importing the module: Simply use the `ColorPickerRing` structure which is a regular SwiftUI `View`.
This project uses the [DynamicColor](https://github.com/yannickl/DynamicColor) dependency which lets you write plattform independant color classes. No matter if iOS or macOS. Internally it uses `UIColor` and `NSColor`.

```
import SwiftUI
import ColorPickerRing

struct ContentView: View {
    @State var color = UIColor.red
    
    var body: some View {
        ColorPickerRing(color: $color, strokeWidth: 30)
            .frame(width: 300, height: 300, alignment: .center)
    }
}
```

The color wheel will take all the space it can get unless you frame it to a custom size. You are also able to specify the `strokeWidth` of the color wheel over the given property.

## Usage with SwiftUI Color

As the native SwiftUI `Color` is implemented as a view rather than a model data structure it won't be used as data structure in the future. This is conforming with the indices provided by Apple: They implemented a @frozen property for their `Color` class which could be interpreted that they won't provide any further interfaces for data extraction to their `Color` view class. 

## License

You can use this software under the terms and conditions of the MIT License.

Hendrik Ulbrich © 2020
