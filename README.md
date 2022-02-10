<img src="https://i.imgur.com/MfDKHcT.gif" width = 100%>

[![CI Status](https://img.shields.io/travis/ChaminLee/BeautyAlert.svg?style=flat)](https://travis-ci.org/ChaminLee/BeautyAlert) [![Version](https://img.shields.io/cocoapods/v/BeautyAlert.svg?style=flat)](https://cocoapods.org/pods/BeautyAlert) [![License](https://img.shields.io/cocoapods/l/BeautyAlert.svg?style=flat)](https://cocoapods.org/pods/BeautyAlert) [![Platform](https://img.shields.io/cocoapods/p/BeautyAlert.svg?style=flat)](https://cocoapods.org/pods/BeautyAlert)

BeautyAlert helps you can easily design by determining the color, shape, and shadow direction of the alert according to your app style.

## Requirements

- swift: 4.0 or higher
- iOS: 13.0 or higher

## Installation

BeautyAlert is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BeautyAlert'
```

## Usage

### 1. Create Alert

create `BeautyAlert` instance
```swift 
let beautyAlert = BeautyAlert()
```

### 2. Configure your alert style

You can choose the title and content messages, their color, and the color of the entire background.

```swift 
beautyAlert.setContentAttribute(title: "BeautyAlert Title ✨", 
                                titleColor: .black, 
                                message: "BeautyAlert helps to make custom alert easily", 
                                messageColor: .black, 
                                backgroundColor: .white)
```

### 3. Add custom buttons with custom actions

You can create a confirmation and cancel button, and you can also specify an action for each button.

```swift
// Cancel Button
beautyAlert.addButton(title: "Cancel",
                      titleColor: .black,
                      backgroundColor: .lightGray, 
                      style: .cancel, 
                      action: cancelAction)
// OK Button
beautyAlert.addButton(title: "OK",
                      titleColor: .white,
                      backgroundColor: .orange, 
                      style: .confirm,
                      action: confirmAction)

// Actions 
func confirmAction() {
    // do confirm actions
}

func cancelAction() {
    // do cancel actions
    self.dismiss(animated: true, completion: nil)
}
```

### 4. Present it!

Just present and use it!

```swift
self.present(beautyAlert, animated: true, completion: nil)
```

### 5. Simulation 

<img src="https://i.imgur.com/5KCCa7j.gif" width=50%>

<br> 
<br> 

|case1|case2|...|
|:---:|:---:|:---:|
|![](https://i.imgur.com/ObEeJns.png)|![](https://i.imgur.com/sBKCqbD.png)|...|

Make a alert style that you want!




## Author

ChaminLee, trueman9512@naver.com

## License

BeautyAlert is available under the MIT license. See the LICENSE file for more info.
