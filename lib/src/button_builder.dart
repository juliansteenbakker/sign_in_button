import 'package:flutter/material.dart';

@immutable
class SignInButtonBuilder extends StatelessWidget {
  /// This is a builder class for signin button
  ///
  /// Icon can be used to define the signin method
  /// User can use Flutter built-in Icons or font-awesome flutter's Icon
  final IconData? icon;

  /// Override the icon section with a image logo
  /// For example, Google requires a colorized logo,
  /// which FontAwesome cannot display. If both image
  /// and icon are provided, image will take precedence
  final Widget? image;

  /// `mini` tag is used to switch from a full-width signin button to
  final bool mini;

  /// the button's text
  final String text;

  /// Buttons's text style.
  ///
  /// This field is optional
  final TextStyle? textStyle;

  /// The size of the label font
  ///
  /// This field will be overridden if [textStyle] is not null.
  final double fontSize;

  /// backgroundColor is required but textColor is default to `Colors.white`
  /// splashColor is default to `Colors.white30`
  ///
  /// [textColor] field will be overridden if [textStyle] is not null.
  final Color textColor;
  final Color iconColor;
  final Color backgroundColor;
  final Color splashColor;
  final Color highlightColor;

  /// onPressed should be specified as a required field to indicate the callback.
  final Function onPressed;

  /// padding is default to `EdgeInsets.all(3.0)`
  final EdgeInsets? padding;
  final EdgeInsets? innerPadding;

  /// shape is to specify the custom shape of the widget.
  /// However the flutter widgets contains restriction or bug
  /// on material button, hence, comment out.
  final ShapeBorder? shape;

  /// elevation has default value of 2.0
  final double elevation;

  /// the height of the button
  final double? height;

  /// width is default to be 1/1.5 of the screen
  final double? width;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.none], and must not be null.
  final Clip clipBehavior;

  /// The constructor is self-explanatory.
  const SignInButtonBuilder({
    Key? key,
    required this.backgroundColor,
    required this.onPressed,
    required this.text,
    this.icon,
    this.image,
    this.fontSize = 14.0,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    this.splashColor = Colors.white30,
    this.highlightColor = Colors.white30,
    this.padding,
    this.innerPadding,
    this.mini = false,
    this.elevation = 2.0,
    this.shape,
    this.height,
    this.width,
    this.clipBehavior = Clip.none,
    this.textStyle,
  }) : super(key: key);

  /// The build function will be help user to build the signin button widget.
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      key: key,
      minWidth: mini ? width ?? 35.0 : null,
      height: height,
      elevation: elevation,
      padding: padding ?? EdgeInsets.zero,
      color: backgroundColor,
      onPressed: onPressed as void Function()?,
      splashColor: splashColor,
      highlightColor: highlightColor,
      shape: shape ?? ButtonTheme.of(context).shape,
      clipBehavior: clipBehavior,
      child: _getButtonChild(context),
    );
  }

  /// Get the inner content of a button
  Widget _getButtonChild(BuildContext context) {
    if (mini) {
      return SizedBox(
        width: height ?? 35.0,
        height: width ?? 35.0,
        child: _getIconOrImage(),
      );
    }

    final double buttonWidth = width ?? 220;

    return Container(
      constraints: BoxConstraints(maxWidth: buttonWidth),
      child: Center(
        child: Row(
          children: <Widget>[
            Padding(
              padding: innerPadding ??
                  const EdgeInsets.symmetric(
                    horizontal: 13,
                  ),
              child: _getIconOrImage(),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: buttonWidth - 50,
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: textStyle ??
                      TextStyle(
                        color: textColor,
                        fontSize: fontSize,
                        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Get the icon or image widget
  Widget _getIconOrImage() {
    if (image != null) {
      return image!;
    }
    return Icon(
      icon,
      size: 20,
      color: iconColor,
    );
  }
}
