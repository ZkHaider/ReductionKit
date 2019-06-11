<p align="center">
    <img src="https://raw.githubusercontent.com/ZkHaider/ReductionKit/master/.github/Assets/Reduction_Kit_Logo.png" alt="ReductionKit by ZkHaider" width="200" />
</p>

#

ReductionKit is a declarative Redux architecture for iOS. The main goals for ReductionKit is to allow expressive, and simple declarations of your State, ViewModel, and View models.

#

## Background 

Architecture should be easy, declarative, and composable. 

## Installation

ReductionKit is available via Carthage, just add to your Cartfile like so:

```shell
$ github "ZkHaider/ReductionKit" "master"
```

```shell 
$ carthage update ReductionKit
```

## Usage 

Create a module by subclassing the `SubModule` type:

```swift 
final class MyModule: SubModule {

    override var moduleDescription: ModuleDescription {
        return .module()
    }

}
```
A `SubModule` holds `Components` or other child `SubModules` there are the following parts available:

* `SubModules`
* `StateProvider` 
* `MiddleWare` 
* `ViewModelProvider`
* `ViewComponent` & `WeakViewComponent`
* `ViewControllerComponent` & `WeakViewControllerComponent`
* `WindowComponent`

Model your state by defining and compartmentalizing components in your description:

```swift 

final class MyViewController: UIViewController, AnyComponent {

    var anyModule: SubModule?
    func bind(module: SubModule) {
        self.anyModule = module
    }

}

final class MyModule: SubModule {

    struct MyState {
        var counter: Int
    }

    override var moduleDescription: ModuleDescription {
        return .module(
            .state(
                initialState: MyState(counter: 0)
            ),
            .views( 
                .viewController(of: MyViewController.self)
            )
        )
    }

}
```
This will create a module with a `StateProvider` which holds an initial state of `MyState` with a `counter` of `0` and a view controller binded to this module of type `MyViewController`.
