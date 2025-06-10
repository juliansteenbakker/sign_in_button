import 'package:flutter/material.dart';

/// A customizable button widget for various sign-in methods.
///
/// This widget provides a flexible way to create sign-in buttons with options
/// for icons, images, text, and loading indicators. It supports both full-width
/// and mini (icon-only) styles.
@immutable
class SignInButtonBuilder extends StatelessWidget {
  /// The constructor is self-explanatory.
  const SignInButtonBuilder({
    required this.backgroundColor,
    required this.onPressed,
    required this.text,
    Key? key,
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

  /// An optional [IconData] to display as the button's icon.
  ///
  /// This can be a Flutter built-in [Icons] or an icon from a package like
  /// `font_awesome_flutter`. If [image] is also provided, [image] will take
  /// precedence.
  final IconData? icon;

  /// An optional [Widget] to display as the button's logo, overriding [icon].
  ///
  /// This is useful for logos that require specific coloring or complex designs
  /// that cannot be achieved with an [IconData], such as the Google logo.
  final Widget? image;

  /// If `true`, the button will be displayed in a compact, icon-only mini
  /// style.
  ///
  /// Defaults to `false`, displaying a full-width button with text and an
  /// icon/image.
  final bool mini;

  /// The text displayed on the button.
  final String text;

  /// The text style for the button's [text].
  ///
  /// If provided, this will override [fontSize] and [textColor].
  final TextStyle? textStyle;

  /// The font size of the button's [text].
  ///
  /// Defaults to `14.0`. This field will be overridden if [textStyle] is not
  /// null.
  final double fontSize;

  /// The color of the button's [text].
  ///
  /// Defaults to `Colors.white`. This field will be overridden if [textStyle]
  /// is not null.
  final Color textColor;

  /// The color of the [icon].
  ///
  /// Defaults to `Colors.white`. This color only applies if an [icon] is used.
  final Color iconColor;

  /// The background color of the button.
  final Color backgroundColor;

  /// The color of the ink splash effect when the button is pressed.
  ///
  /// Defaults to `Colors.white30`.
  final Color splashColor;

  /// The color of the highlight when the button is pressed.
  ///
  /// Defaults to `Colors.white30`.
  final Color highlightColor;

  /// The callback function to be called when the button is pressed.
  ///
  /// If [isLoading] is `true`, this callback will be disabled.
  final Function onPressed;

  /// The padding around the entire button.
  ///
  /// Defaults to `EdgeInsets.zero`.
  final EdgeInsets? padding;

  /// The inner padding between the icon/image and the text.
  ///
  /// Defaults to `EdgeInsets.symmetric(horizontal: 13)`.
  final EdgeInsets? innerPadding;

  /// The custom shape of the button.
  ///
  /// If not provided, the button will use the default shape from the current
  /// [ButtonTheme].
  final ShapeBorder? shape;

  /// The z-coordinate at which to place this button relative to its parent.
  ///
  /// Defaults to `2.0`.
  final double elevation;

  /// The height of the button.
  ///
  /// If `mini` is `true`, this will also affect the size of the icon container.
  final double? height;

  /// The width of the button.
  ///
  /// If `mini` is `true`, this will also affect the size of the icon container.
  /// For full-width buttons, the default is approximately 220 pixels.
  final double? width;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.none], and must not be null.
  final Clip clipBehavior;

  /// If `true`, a loading indicator will be shown instead of the button
  /// content, and [onPressed] will be disabled.
  final bool isLoading;

  /// The color of the [CircularProgressIndicator] shown when [isLoading] is
  /// `true`.
  ///
  /// Defaults to `Colors.white`.
  final Color? loadingIndicatorColor;

  /// The duration of the animation when switching between the button content
  /// and the loading indicator.
  ///
  /// Defaults to `Duration(milliseconds: 300)`.
  final Duration animationDuration;

  /// The curve of the animation when switching between the button content
  /// and the loading indicator.
  ///
  /// Defaults to `Curves.easeInOut`.
  final Curve animationCurve;

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

    final buttonWidth = width ?? 220;

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
        color: loadingIndicatorColor,
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
