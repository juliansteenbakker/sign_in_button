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

  /// Indicates if the button is in a loading state.
  final bool isLoading;

  /// The color of the loading indicator. Defaults to [Colors.white].
  final Color? loadingIndicatorColor;

  /// The duration of the animation when switching between content and loading state.
  final Duration animationDuration;

  /// The curve of the animation when switching between content and loading state.
  final Curve animationCurve;

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
    this.isLoading = false,
    this.loadingIndicatorColor,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
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
      onPressed: isLoading ? null : onPressed as void Function()?,
      splashColor: splashColor,
      highlightColor: highlightColor,
      shape: shape ?? ButtonTheme.of(context).shape,
      clipBehavior: clipBehavior,
      child: _getAnimatedButtonChild(context),
    );
  }

  /// Get the animated inner content of a button
  Widget _getAnimatedButtonChild(BuildContext context) {
    return AnimatedSwitcher(
      duration: animationDuration,
      switchInCurve: animationCurve,
      switchOutCurve: animationCurve,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: isLoading ? _getLoadingIndicator() : _getButtonContent(context),
    );
  }

  /// Get the inner content of a button (excluding the loading indicator)
  Widget _getButtonContent(BuildContext context) {
    if (mini) {
      return SizedBox(
        key: const ValueKey(
            'button_icon_mini'), // Add a key for AnimatedSwitcher
        width: height ?? 35.0,
        height: width ?? 35.0,
        child: _getIconOrImage(),
      );
    }

    final double buttonWidth = width ?? 220;

    return Container(
      key: const ValueKey(
          'button_content_full'), // Add a key for AnimatedSwitcher
      constraints: BoxConstraints(maxWidth: buttonWidth),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
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

  /// Get the loading indicator widget
  Widget _getLoadingIndicator() {
    return SizedBox(
      key:
          const ValueKey('loading_indicator'), // Add a key for AnimatedSwitcher
      width: mini
          ? (height ?? 24.0)
          : 24.0, // Smaller indicator for mini, standard for full
      height: mini ? (width ?? 24.0) : 24.0,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(
            loadingIndicatorColor ?? Colors.white),
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
