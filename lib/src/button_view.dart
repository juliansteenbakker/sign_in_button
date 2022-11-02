import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_in_button/src/button_builder.dart';
import 'package:sign_in_button/src/button_list.dart';

class SignInButton extends StatelessWidget {
  /// Here are the buttons builder which integrate with button builder
  /// and the buttons list.
  ///
  /// The `SignInButton` class already contains general used buttons.
  /// In case of other buttons, user can always use `SignInButtonBuilder`
  /// to build the sign in button.

  /// onPressed function should be passed in as a required field.
  final Function onPressed;

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
  })  : assert(
          mini != true ||
              !(button == Buttons.google ||
                  button == Buttons.googleDark ||
                  button == Buttons.facebookNew),
          'Google and FacebookNew buttons do not support mini mode',
        ),
        super(key: key);

  /// The build function is used to build the widget which will switch to
  /// desired widget based on the enum class `Buttons`
  @override
  Widget build(BuildContext context) {
    switch (button) {
      case Buttons.google:
      case Buttons.googleDark:
        return SignInButtonBuilder(
          elevation: elevation,
          key: const ValueKey('Google'),
          text: text ?? 'Sign in with Google',
          textColor: button == Buttons.google
              ? const Color.fromRGBO(0, 0, 0, 0.9)
              : const Color(0xFFFFFFFF),
          image: Container(
            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: AssetImage(
                  button == Buttons.google
                      ? 'assets/logos/google_light.png'
                      : 'assets/logos/google_dark.png',
                  package: 'sign_in_button',
                ),
                height: 36.0,
              ),
            ),
          ),
          backgroundColor: button == Buttons.google
              ? const Color(0xFFFFFFFF)
              : const Color(0xFF4285F4),
          onPressed: onPressed,
          padding: padding,
          innerPadding: EdgeInsets.zero,
          shape: shape,
          height: 36.0,
        );
      case Buttons.facebook:
      case Buttons.facebookNew:
        return SignInButtonBuilder(
          elevation: elevation,
          key: const ValueKey('Facebook'),
          mini: mini,
          text: text ?? 'Sign in with Facebook',
          icon: FontAwesomeIcons.facebookF,
          image: button == Buttons.facebookNew
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
          backgroundColor: button == Buttons.facebookNew
              ? const Color(0xFF1877f2)
              : const Color(0xFF3B5998),
          innerPadding: button == Buttons.facebookNew
              ? const EdgeInsets.fromLTRB(12, 0, 11, 0)
              : null,
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
      case Buttons.gitHub:
        return SignInButtonBuilder(
          elevation: elevation,
          key: const ValueKey('GitHub'),
          mini: mini,
          text: text ?? 'Sign in with GitHub',
          icon: FontAwesomeIcons.github,
          backgroundColor: const Color(0xFF444444),
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
      case Buttons.apple:
      case Buttons.appleDark:
        return SignInButtonBuilder(
          elevation: elevation,
          key: const ValueKey('Apple'),
          mini: mini,
          text: text ?? 'Sign in with Apple',
          textColor: button == Buttons.apple
              ? const Color.fromRGBO(0, 0, 0, 0.9)
              : Colors.white,
          icon: FontAwesomeIcons.apple,
          iconColor: button == Buttons.apple ? Colors.black : Colors.white,
          backgroundColor: button == Buttons.apple
              ? const Color(0xFFFFFFFF)
              : const Color(0xFF000000),
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
      case Buttons.linkedIn:
        return SignInButtonBuilder(
          elevation: elevation,
          key: const ValueKey('LinkedIn'),
          mini: mini,
          text: text ?? 'Sign in with LinkedIn',
          icon: FontAwesomeIcons.linkedinIn,
          backgroundColor: const Color(0xFF007BB6),
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
      case Buttons.pinterest:
        return SignInButtonBuilder(
          elevation: elevation,
          key: const ValueKey('Pinterest'),
          mini: mini,
          text: text ?? 'Sign in with Pinterest',
          icon: FontAwesomeIcons.pinterest,
          backgroundColor: const Color(0xFFCB2027),
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
      case Buttons.tumblr:
        return SignInButtonBuilder(
          elevation: elevation,
          key: const ValueKey('Tumblr'),
          mini: mini,
          text: text ?? 'Sign in with Tumblr',
          icon: FontAwesomeIcons.tumblr,
          backgroundColor: const Color(0xFF34526f),
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
      case Buttons.twitter:
        return SignInButtonBuilder(
          elevation: elevation,
          key: const ValueKey('Twitter'),
          mini: mini,
          text: text ?? 'Sign in with Twitter',
          icon: FontAwesomeIcons.twitter,
          backgroundColor: const Color(0xFF1DA1F2),
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
      case Buttons.reddit:
        return SignInButtonBuilder(
          elevation: elevation,
          key: const ValueKey('Reddit'),
          mini: mini,
          text: text ?? 'Sign in with Reddit',
          icon: FontAwesomeIcons.reddit,
          backgroundColor: const Color(0xFFFF4500),
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
      case Buttons.quora:
        return SignInButtonBuilder(
          key: const ValueKey('Quora'),
          mini: mini,
          text: text ?? 'Sign in with Quora',
          icon: FontAwesomeIcons.quora,
          backgroundColor: const Color(0x00a40a00),
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
      case Buttons.yahoo:
        return SignInButtonBuilder(
          key: const ValueKey('Yahoo'),
          mini: mini,
          text: text ?? 'Sign in with Yahoo',
          icon: FontAwesomeIcons.yahoo,
          backgroundColor: const Color(0x006001d2),
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
      case Buttons.hotmail:
        return SignInButtonBuilder(
          key: const ValueKey('Hotmail'),
          mini: mini,
          text: text ?? 'Sign in with Hotmail',
          icon: FontAwesomeIcons.commentSms,
          backgroundColor: const Color(0x000072c6),
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
      case Buttons.xbox:
        return SignInButtonBuilder(
          key: const ValueKey('Xbox'),
          mini: mini,
          text: text ?? 'Sign in with Xbox',
          icon: FontAwesomeIcons.xbox,
          backgroundColor: const Color(0x00107c0f),
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
      case Buttons.microsoft:
        return SignInButtonBuilder(
          key: const ValueKey('Microsoft'),
          mini: mini,
          text: text ?? 'Sign in with Microsoft',
          icon: FontAwesomeIcons.microsoft,
          backgroundColor: const Color(0xff235A9F),
          onPressed: onPressed,
          padding: padding,
          shape: shape,
        );
      case Buttons.anonymous:
        return SignInButtonBuilder(
          elevation: elevation,
          key: const ValueKey('Anonymous'),
          mini: mini,
          text: text ?? 'Anonymous',
          textColor: const Color.fromRGBO(0, 0, 0, 0.9),
          icon: Icons.account_circle,
          iconColor: Colors.grey,
          backgroundColor: const Color(0xFFFFFFFF),
          onPressed: onPressed,
          padding: padding,
          shape: shape,
          height: 36.0,
        );
      case Buttons.email:
      default:
        return SignInButtonBuilder(
          elevation: elevation,
          key: const ValueKey('Email'),
          mini: mini,
          text: text ?? 'Sign in with Email',
          icon: Icons.email,
          onPressed: onPressed,
          padding: padding,
          backgroundColor: Colors.grey[700]!,
          shape: shape,
        );
    }
  }
}
