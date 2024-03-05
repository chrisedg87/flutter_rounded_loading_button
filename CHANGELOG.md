## [3.0.0]
* Replaced deprecated uses of `onSurface` and `primary` color arguments.

## [2.2.0] BREAKING CHANGES
* Changed `successIcon` and `failedIcon` from type [IconData] to [Icon] to support styling.

## [2.1.0]
* Fixed issues related to late initialisation in the controller (Programmatically stop and start fails #47)
* Added safety against bad state errors (Unhandled Exception: Bad state: Cannot add new events after calling close #48)
* Resolved a bunch of lints and code style issues

## [2.0.9]
* Added ability to listen to and query button status from the controller

## [2.0.8]
* Added success and error icons parameters
* Added completion curve and duration parameters

## [2.0.7]
* Updated rxdart constraints 
* Updated the screenshot

## [2.0.6]
* Fixed bug with state key
* Added the auto reset functionality 

## [2.0.5]
* Fixed disabled colour issue

## [2.0.4]
* Fixed disabled issue

## [2.0.3]
* Style effective dart

## [2.0.2]
* Thanks for [joaovvrodrigues](https://github.com/joaovvrodrigues) ([#32](https://github.com/chrisedg87/flutter_rounded_loading_button/pull/32) by [joaovvrodrigues](https://github.com/joaovvrodrigues)).
* Fix button animation!

## [2.0.1]
* Thanks for [joaovvrodrigues](https://github.com/joaovvrodrigues) ([#32](https://github.com/chrisedg87/flutter_rounded_loading_button/pull/32) by [joaovvrodrigues](https://github.com/joaovvrodrigues)).
* Added compatibility with NullSafety
* Removed RaisedButton deprecated
* Add new ElevatedButton
* Update dependencies

## [1.0.18]
* Updated dependencies

## [1.0.17]
* Allow to change color when the button is disabled

## [1.0.16]
* Add custom button color option for success state 
* Add option to resize the CircularProgressIndicator

## [1.0.15]

* Added custom color option for error state

## [1.0.14]

* Updated dartrx package version

## [1.0.13]

* Downgraded rxdart dependency 

## [1.0.12]

* Added documentation
* Formatting fixes

## [1.0.11]

* Fix for print statement 

## [1.0.10]

* Added configurable button elevation

## [1.0.9]

* Added configurable border radius
* Added configurable animation duration

## [1.0.8]

* README fix
* Colour now inherits from theme

## [1.0.7]

* Added configurable circular progress color #8

## [1.0.6]

* Fixed the issue were BehaviorSubject was not closed correctly 
* Fixed the animation reset bug #6

## [1.0.5]

* Fixed loading width bug #3
* Fixed padding issue with the loading spinner
* Fixed button disabled bug #4

## [1.0.4]

* Added animation disposal
* Added configurable width
* Added configurable animation on tapped

## [1.0.3]

* Example test updates

## [1.0.2]

* Example updates

## [1.0.1]

* Format changes
* Description update

## [1.0.0]

* Initial release.
