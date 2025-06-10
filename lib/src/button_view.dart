import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_in_button/src/button_builder.dart';
import 'package:sign_in_button/src/button_list.dart';

class SignInButton extends StatefulWidget {
  /// Here are the buttons builder which integrate with button builder
  /// and the buttons list.
  ///
  /// The `SignInButton` class already contains general used buttons.
  /// In case of other buttons, user can always use `SignInButtonBuilder`
  /// to build the sign in button.

  /// onPressed function should be passed in as a required field.
  /// This function can be asynchronous, and the button will automatically
  /// show a loading indicator while it's executing.
  final Function() onPressed;

  /// button should be used from the enum class `Buttons`
  final Buttons button;

  /// mini is a boolean field which specify whether to use a square mini button.
  final bool mini;

  /// shape is to specify the custom shape of the widget.
  final ShapeBorder? shape;

  /// overrides the default button text
  final String? text;

  /// overrides the default button padding
  final EdgeInsets padding;

  // overrides the default button elevation
  final double elevation;

  /// buttons's text style.
  final TextStyle? textStyle;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.none], and must not be null.
  final Clip clipBehavior;

  /// The color of the loading indicator. This will be passed to [SignInButtonBuilder].
  final Color? loadingIndicatorColor;

  /// The constructor is fairly self-explanatory.
  const SignInButton(
    this.button, {
    Key? key,
    required this.onPressed,
    this.mini = false,
    this.padding = EdgeInsets.zero,
    this.shape,
    this.text,
    this.elevation = 2.0,
    this.clipBehavior = Clip.none,
    this.textStyle,
    this.loadingIndicatorColor,
  })  : assert(
          mini != true ||
              !(button == Buttons.google ||
                  button == Buttons.googleDark ||
                  button == Buttons.facebookNew),
          'Google and FacebookNew buttons do not support mini mode',
        ),
        super(key: key);

  @override
  SignInButtonState createState() => SignInButtonState();
}

class SignInButtonState extends State<SignInButton> {
  bool _isLoading = false;

  // This internal function will handle the execution of onPressed
  // and manage the loading state.
  Future<void> _handleOnPressed() async {
    if (_isLoading) {
      return; // Prevent multiple presses or if onPressed is null
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onPressed.call(); // Execute the user's onPressed function
    } finally {
      // Ensure loading state is reset even if an error occurs
      if (mounted) {
        // Check if the widget is still in the tree
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.button) {
      case Buttons.google:
      case Buttons.googleDark:
        return SignInButtonBuilder(
          elevation: widget.elevation,
          key: const ValueKey('Google'),
          text: widget.text ?? 'Sign in with Google',
          textStyle: widget.textStyle,
          textColor: widget.button == Buttons.google
              ? const Color(0xFF1F1F1F)
              : const Color(0xFFE3E3E3),
          image: Container(
            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: AssetImage(
                  widget.button == Buttons.google
                      ? 'assets/logos/google_light.png'
                      : 'assets/logos/google_dark.png',
                  package: 'sign_in_button',
                ),
                height: 36.0,
              ),
            ),
          ),
          backgroundColor: widget.button == Buttons.google
              ? const Color(0xFFFFFFFF)
              : const Color(0xFF4285F4),
          onPressed: _handleOnPressed, // Use the wrapped handler
          padding: widget.padding,
          innerPadding: EdgeInsets.zero,
          shape: widget.shape,
          height: 36.0,
          clipBehavior: widget.clipBehavior,
          isLoading: _isLoading, // Pass internal state
          loadingIndicatorColor: widget.loadingIndicatorColor ??
              (widget.button == Buttons.google ? Colors.blue : Colors.white),
        );
      case Buttons.facebook:
      case Buttons.facebookNew:
        return SignInButtonBuilder(
          elevation: widget.elevation,
          key: const ValueKey('Facebook'),
          mini: widget.mini,
          text: widget.text ?? 'Sign in with Facebook',
          textStyle: widget.textStyle,
          icon: FontAwesomeIcons.facebookF,
          image: widget.button == Buttons.facebookNew
              ? const ClipRRect(
                  child: Image(
                    image: AssetImage(
                      'assets/logos/facebook_new.png',
                      package: 'sign_in_button',
                    ),
                    height: 24.0,
                  ),
                )
              : null,
          backgroundColor: widget.button == Buttons.facebookNew
              ? const Color(0xFF1877f2)
              : const Color(0xFF3B5998),
          innerPadding: widget.button == Buttons.facebookNew
              ? const EdgeInsets.fromLTRB(12, 0, 11, 0)
              : null,
          onPressed: _handleOnPressed,
          padding: widget.padding,
          shape: widget.shape,
          clipBehavior: widget.clipBehavior,
          isLoading: _isLoading,
          loadingIndicatorColor: widget.loadingIndicatorColor ?? Colors.white,
        );
      case Buttons.gitHub:
        return SignInButtonBuilder(
          elevation: widget.elevation,
          key: const ValueKey('GitHub'),
          mini: widget.mini,
          text: widget.text ?? 'Sign in with GitHub',
          textStyle: widget.textStyle,
          icon: FontAwesomeIcons.github,
          backgroundColor: const Color(0xFF444444),
          onPressed: _handleOnPressed,
          padding: widget.padding,
          shape: widget.shape,
          clipBehavior: widget.clipBehavior,
          isLoading: _isLoading,
          loadingIndicatorColor: widget.loadingIndicatorColor ?? Colors.white,
        );
      case Buttons.apple:
      case Buttons.appleDark:
        return SignInButtonBuilder(
          elevation: widget.elevation,
          key: const ValueKey('Apple'),
          mini: widget.mini,
          text: widget.text ?? 'Sign in with Apple',
          textStyle: widget.textStyle,
          textColor: widget.button == Buttons.apple
              ? const Color.fromRGBO(0, 0, 0, 0.9)
              : Colors.white,
          icon: FontAwesomeIcons.apple,
          iconColor:
              widget.button == Buttons.apple ? Colors.black : Colors.white,
          backgroundColor: widget.button == Buttons.apple
              ? const Color(0xFFFFFFFF)
              : const Color(0xFF000000),
          onPressed: _handleOnPressed,
          padding: widget.padding,
          shape: widget.shape,
          clipBehavior: widget.clipBehavior,
          isLoading: _isLoading,
          loadingIndicatorColor: widget.loadingIndicatorColor ??
              (widget.button == Buttons.apple ? Colors.black : Colors.white),
        );
      case Buttons.linkedIn:
        return SignInButtonBuilder(
          elevation: widget.elevation,
          key: const ValueKey('LinkedIn'),
          mini: widget.mini,
          text: widget.text ?? 'Sign in with LinkedIn',
          textStyle: widget.textStyle,
          icon: FontAwesomeIcons.linkedinIn,
          backgroundColor: const Color(0xFF007BB6),
          onPressed: _handleOnPressed,
          padding: widget.padding,
          shape: widget.shape,
          clipBehavior: widget.clipBehavior,
          isLoading: _isLoading,
          loadingIndicatorColor: widget.loadingIndicatorColor ?? Colors.white,
        );
      case Buttons.pinterest:
        return SignInButtonBuilder(
          elevation: widget.elevation,
          key: const ValueKey('Pinterest'),
          mini: widget.mini,
          text: widget.text ?? 'Sign in with Pinterest',
          textStyle: widget.textStyle,
          icon: FontAwesomeIcons.pinterest,
          backgroundColor: const Color(0xFFCB2027),
          onPressed: _handleOnPressed,
          padding: widget.padding,
          shape: widget.shape,
          clipBehavior: widget.clipBehavior,
          isLoading: _isLoading,
          loadingIndicatorColor: widget.loadingIndicatorColor ?? Colors.white,
        );
      case Buttons.tumblr:
        return SignInButtonBuilder(
          elevation: widget.elevation,
          key: const ValueKey('Tumblr'),
          mini: widget.mini,
          text: widget.text ?? 'Sign in with Tumblr',
          textStyle: widget.textStyle,
          icon: FontAwesomeIcons.tumblr,
          backgroundColor: const Color(0xFF34526f),
          onPressed: _handleOnPressed,
          padding: widget.padding,
          shape: widget.shape,
          clipBehavior: widget.clipBehavior,
          isLoading: _isLoading,
          loadingIndicatorColor: widget.loadingIndicatorColor ?? Colors.white,
        );
      case Buttons.twitter:
        return SignInButtonBuilder(
          elevation: widget.elevation,
          key: const ValueKey('Twitter'),
          mini: widget.mini,
          text: widget.text ?? 'Sign in with Twitter',
          textStyle: widget.textStyle,
          icon: FontAwesomeIcons.twitter,
          backgroundColor: const Color(0xFF1DA1F2),
          onPressed: _handleOnPressed,
          padding: widget.padding,
          shape: widget.shape,
          clipBehavior: widget.clipBehavior,
          isLoading: _isLoading,
          loadingIndicatorColor: widget.loadingIndicatorColor ?? Colors.white,
        );
      case Buttons.reddit:
        return SignInButtonBuilder(
          elevation: widget.elevation,
          key: const ValueKey('Reddit'),
          mini: widget.mini,
          text: widget.text ?? 'Sign in with Reddit',
          textStyle: widget.textStyle,
          icon: FontAwesomeIcons.reddit,
          backgroundColor: const Color(0xFFFF4500),
          onPressed: _handleOnPressed,
          padding: widget.padding,
          shape: widget.shape,
          clipBehavior: widget.clipBehavior,
          isLoading: _isLoading,
          loadingIndicatorColor: widget.loadingIndicatorColor ?? Colors.white,
        );
      case Buttons.quora:
        return SignInButtonBuilder(
          key: const ValueKey('Quora'),
          mini: widget.mini,
          text: widget.text ?? 'Sign in with Quora',
          textStyle: widget.textStyle,
          icon: FontAwesomeIcons.quora,
          backgroundColor: const Color(0x00a40a00),
          onPressed: _handleOnPressed,
          padding: widget.padding,
          shape: widget.shape,
          clipBehavior: widget.clipBehavior,
          isLoading: _isLoading,
          loadingIndicatorColor: widget.loadingIndicatorColor ?? Colors.white,
        );
      case Buttons.yahoo:
        return SignInButtonBuilder(
          key: const ValueKey('Yahoo'),
          mini: widget.mini,
          text: widget.text ?? 'Sign in with Yahoo',
          textStyle: widget.textStyle,
          icon: FontAwesomeIcons.yahoo,
          backgroundColor: const Color(0x006001d2),
          onPressed: _handleOnPressed,
          padding: widget.padding,
          shape: widget.shape,
          clipBehavior: widget.clipBehavior,
          isLoading: _isLoading,
          loadingIndicatorColor: widget.loadingIndicatorColor ?? Colors.white,
        );
      case Buttons.hotmail:
        return SignInButtonBuilder(
          key: const ValueKey('Hotmail'),
          mini: widget.mini,
          text: widget.text ?? 'Sign in with Hotmail',
          textStyle: widget.textStyle,
          icon: FontAwesomeIcons.commentSms,
          backgroundColor: const Color(0x000072c6),
          onPressed: _handleOnPressed,
          padding: widget.padding,
          shape: widget.shape,
          clipBehavior: widget.clipBehavior,
          isLoading: _isLoading,
          loadingIndicatorColor: widget.loadingIndicatorColor ?? Colors.white,
        );
      case Buttons.xbox:
        return SignInButtonBuilder(
          key: const ValueKey('Xbox'),
          mini: widget.mini,
          text: widget.text ?? 'Sign in with Xbox',
          textStyle: widget.textStyle,
          icon: FontAwesomeIcons.xbox,
          backgroundColor: const Color(0x00107c0f),
          onPressed: _handleOnPressed,
          padding: widget.padding,
          shape: widget.shape,
          clipBehavior: widget.clipBehavior,
          isLoading: _isLoading,
          loadingIndicatorColor: widget.loadingIndicatorColor ?? Colors.white,
        );
      case Buttons.microsoft:
        return SignInButtonBuilder(
          key: const ValueKey('Microsoft'),
          mini: widget.mini,
          text: widget.text ?? 'Sign in with Microsoft',
          textStyle: widget.textStyle,
          icon: FontAwesomeIcons.microsoft,
          backgroundColor: const Color(0xff235A9F),
          onPressed: _handleOnPressed,
          padding: widget.padding,
          shape: widget.shape,
          clipBehavior: widget.clipBehavior,
          isLoading: _isLoading,
          loadingIndicatorColor: widget.loadingIndicatorColor ?? Colors.white,
        );
      case Buttons.anonymous:
        return SignInButtonBuilder(
          elevation: widget.elevation,
          key: const ValueKey('Anonymous'),
          mini: widget.mini,
          text: widget.text ?? 'Anonymous',
          textStyle: widget.textStyle,
          textColor: const Color.fromRGBO(0, 0, 0, 0.9),
          icon: Icons.account_circle,
          iconColor: Colors.grey,
          backgroundColor: const Color(0xFFFFFFFF),
          onPressed: _handleOnPressed,
          padding: widget.padding,
          shape: widget.shape,
          height: 36.0,
          clipBehavior: widget.clipBehavior,
          isLoading: _isLoading,
          loadingIndicatorColor: widget.loadingIndicatorColor ?? Colors.grey,
        );
      case Buttons.email:
      default:
        return SignInButtonBuilder(
          elevation: widget.elevation,
          key: const ValueKey('Email'),
          mini: widget.mini,
          text: widget.text ?? 'Sign in with Email',
          textStyle: widget.textStyle,
          icon: Icons.email,
          onPressed: _handleOnPressed,
          padding: widget.padding,
          backgroundColor: Colors.grey[700]!,
          shape: widget.shape,
          clipBehavior: widget.clipBehavior,
          isLoading: _isLoading,
          loadingIndicatorColor: widget.loadingIndicatorColor ?? Colors.white,
        );
    }
  }
}
