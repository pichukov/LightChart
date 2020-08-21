
<div align="center">
  <img width="400" src="https://raw.githubusercontent.com/pichukov/PublicAssets/master/lightChartLogo.png">
</div>

<!-- ![Light Chart]() -->

**LightChart** is a lightweight **SwiftUI** package with line charts implementation. You can use it when you need only a chart that will perfectly fit into your View. It doesn't have any interaction, titles, different types of diagram or anything else, just a representation of your data set.

Currently `LightChart` have only `line` type of chart with sharp corners or a curved one. That's how it looks in the real application on currency exchange rates example:

<div align="center">
  <img width="700" src="https://raw.githubusercontent.com/pichukov/PublicAssets/master/lightChartExample.png">
</div>

## Installation

It's a Swift Package, so you need to do the following:

- Open `File` in Xcode menu
- Open `Swift Packages`
- Choose `Add Package Dependency...` option
- In the `Enter package repository URL` field paste this URL: `https://github.com/pichukov/LightChart`
- Choose any existing version or a `master` branch option

## Usage

Add `import LightChart`
Add `LightChartView` into your SwiftUI code
```swift
LightChartView(data: [4, 8, 12, 10, 25])
```
By default it will draw a red line chart:

<div align="left">
  <img width="200" src="https://raw.githubusercontent.com/pichukov/PublicAssets/master/defaultCart.png">
</div>

To customize it you can use several properties:

##### type
The type of chart, it's an `enum` with two cases:
- `.line` is a default type that will draw a chart presented above
- `.curved` will draw a curved chart, for example:
```swift
LightChartView(data: [2, 17, 9, 23, 10], type: .curved)
```
<div align="left">
    <img width="200" src="https://raw.githubusercontent.com/pichukov/PublicAssets/master/curvedCart.png">
</div>

##### visualType
The visual part of the chart. An `enum` with three cases:
- `.outline(color: Color, lineWidth: CGFloat)` to specify a `color` and `lineWidth` for `stroke`
```swift
LightChartView(data: [2, 17, 9, 23, 10], 
               type: .curved, 
               visualType: .outline(color: .green, lineWidth: 5))
```
<div align="left">
    <img width="200" src="https://raw.githubusercontent.com/pichukov/PublicAssets/master/visualTypeOutlineCart.png">
</div>

- `.filled(color: Color, lineWidth: CGFloat)` use stroke color to fill the chart with a gradient
```swift
LightChartView(data: [2, 17, 9, 23, 10],
               type: .curved,
               visualType: .filled(color: .green, lineWidth: 5))
```
<div align="left">
    <img width="200" src="https://raw.githubusercontent.com/pichukov/PublicAssets/master/visualTypeFilledChart.png">
</div>

- `.customFilled(color: Color, lineWidth: CGFloat, fillGradient: LinearGradient)` also provides an option to change the fill gradient
```swift
LightChartView(data: [2, 17, 9, 23, 10],
               type: .curved,
               visualType: .customFilled(color: .red,
                                         lineWidth: 3,
                                         fillGradient: LinearGradient(
                                                    gradient: .init(colors: [Color.orange.opacity(0.7), Color.orange.opacity(0.1)]),
                                                    startPoint: .init(x: 0.5, y: 1),
                                                    endPoint: .init(x: 0.5, y: 0)
                                                 )))
```
<div align="left">
    <img width="200" src="https://raw.githubusercontent.com/pichukov/PublicAssets/master/visualTypeCustomFilledChart.png">
</div>

##### offset
By default the `offset` is `0` and it means that the chart takes up the entire area of the parent view. You can move the chart line up with changing the `offset` value. For example if you will use the `offset: 0.2` you chart line will move up and take only 80% of the parent view
```swift
LightChartView(data: [2, 17, 9, 23, 10],
               type: .curved,
               visualType: .filled(color: .green, lineWidth: 3),
               offset: 0.2)
```
<div align="left">
    <img width="200" src="https://raw.githubusercontent.com/pichukov/PublicAssets/master/curvedOffsetChart.png">
</div>
As you can see on picture above the offset effects only the chart line but not the fill gradient

##### currentValueLineType
There is an option to add a horizontal line that will point the last value of the data set. A `currentValueLineType` is an `enum` that has three cases:
- `.none` is a default value that doesn't show any line
- `.line(color: Color, lineWidth: CGFloat)` adds a line with `color` and `lineWidth` for a `stroke`
```swift
LightChartView(data: [2, 17, 9, 23, 10],
               type: .curved,
               visualType: .filled(color: .green, lineWidth: 3),
               offset: 0.2,
               currentValueLineType: .line(color: .gray, lineWidth: 1))
```
<div align="left">
    <img width="200" src="https://raw.githubusercontent.com/pichukov/PublicAssets/master/curvedValueLineChart.png">
</div>

- `.dash(color: Color, lineWidth: CGFloat, dash: [CGFloat])` adds a dashed line
```swift
LightChartView(data: [2, 17, 9, 23, 10],
               type: .curved,
               visualType: .filled(color: .green, lineWidth: 3),
               offset: 0.2,
               currentValueLineType: .dash(color: .gray, lineWidth: 1, dash: [5]))
```
<div align="left">
    <img width="200" src="https://raw.githubusercontent.com/pichukov/PublicAssets/master/curvedValueDashLineChart.png">
</div>
