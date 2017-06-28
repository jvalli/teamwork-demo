# teamwork-demo

## What you will need
- Swift 3
- Xcode 8.0 or later
- iOS 9 or later
- CocoaPods

## Installation Steps:

Once you clone the repository you will need to include dependencies into your Xcode project using CocoaPods, so first install the gem:
```
sudo gem install cocoapods
```
Then go to the project folder and run the following command:
```
pod install
```

## Configuration:

The only configuration you will need is to setup your Teamwork credentials on `TWConstants`->`Teamwork`:

- Your Teamwork API token ([How to get your API token?](https://developer.teamwork.com/enabletheapiandgetyourkey))
- Your Teamwork host URL (Example: `https://something.teamwork.com`)

```
class TWConstants {

    public struct Teamwork {
        public static let token = "{Your Teamwork API token}"
        public static let host = "{Your Teamwork host URL}"
    }
...
```
