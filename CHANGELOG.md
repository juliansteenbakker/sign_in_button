## 4.0.1
New Features:
- Changed minimum version of font_awesome_flutter to 10.6.0 in order to support X (formerly Twitter).
- Removed default progress indicator color

## 4.0.0
New Features:
- Adds a circular progress indicator for loading state. This will only happen when onPressed is async
and executing.
- Added X (Formerly Twitter) to the button list.
- Updated Google button text color to be inline with design specs.
- Added textStyle field for button text.
- Scale down button text if needed to prevent text overflow.

## 3.2.0
Added clipBehavior property to customize the button's clipping. (Thanks @sarbogast !)

## 3.1.0
- Added new anonymous button. (Thanks @juggler98 !)
- Updated colors of apple and google sign in button text to mach each other. (Thanks @juggler98 !)

## 3.0.0
Forked from flutter_signin_button with the following changes:
BREAKING:
- The buttons enums changed to lowerCamelCase
- font_awesome_flutter is upgraded from v9 to v10

Other changes:
- Applied lint style
- Updated example app

## 2.0.0

- Migrated package to null safety
- use dart stable version >= 2.12.0

## 1.1.0

- expose elevation
- add some new buttons
- fix default font in button builder issue

## 1.0.0

- NOT BACKWARD COMPATIBLE
- change width restriction to pixel unit
- consistent hight of default signin buttons
- change default icon size
- change demo action to snack bar

## 0.5.1

- Fix mini button padding
- Use new demo image

## 0.5.2

- Fix readme image

## 0.5.0

- Implement Google Buttons (w/o mini mode) according to Google guidelines. thx to @tariq86

## 0.4.1

- Fix explicit null initialization

## 0.4.0

- Add in padding
- Add in custom font-size to solve overflow
- Add in Signin with Apple

## 0.3.0

- Add in Shape property
- Fix mini for email button

## 0.2.8

- Make text fully customizable thx to @narciero and @LiveLikeCounter

## 0.2.6

- Add Twitter Button
- Fix mini for Email

## 0.2.5

- Add Flutter Badge on Github Readme According to [this repo](https://github.com/ZaynJarvis/Flutter-Badge)
- Add Google Dark button thanks to @g3rrydanc3

## 0.2.4

- Fix the bug on email signin button @matthiasbruns
- Add user configured signin text @matthiasbruns

## 0.2.3

- Delete shape field since Flutter constraint
- Change defalt splash color
- provide user defined splash color in ButtonBuilder Widget

## 0.2.2

- Update documentation of the library.

## 0.2.1

- Update MIT license

## 0.2.0

- add customizable shape # encountering issues here. currently not responsible
- add customizable width
- update lisense
- delete cupercino icons dependency
- refactor code

## 0.1.3

- change full example readme to example folder
- update lisense

## 0.1.2

- delete image from root
- use image from pinterest

## 0.1.1

- fix change log
- update example pubspec

## 0.1.0

- Initial build for flutter sign in button library.
