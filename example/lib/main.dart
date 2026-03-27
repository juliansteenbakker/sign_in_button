import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  /// This is an example app which make use of
  /// `SignInButtonBuilder` and `SignInButton` class
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: const Scaffold(
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
        body: SignInPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  /// Show a simple "___ Button Pressed" indicator
  void _showButtonPressDialog(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$provider Button Pressed!'),
        backgroundColor: Colors.black26,
        duration: const Duration(milliseconds: 400),
      ),
    );
  }

  /// Normally the signin buttons should be contained in the SignInPage
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24),
      children: <Widget>[
        // Custom button via SignInButtonBuilder
        Center(
          child: SignInButtonBuilder(
            text: 'Get going with Email',
            icon: Icons.email,
            onPressed: () {
              _showButtonPressDialog(context, 'Email');
            },
            backgroundColor: Colors.blueGrey[700]!,
            width: 220,
          ),
        ),
        const Divider(),

        // Google
        Center(
          child: SignInButton(
            Buttons.google,
            onPressed: () {
              _showButtonPressDialog(context, 'Google');
            },
          ),
        ),
        const Divider(),
        Center(
          child: SignInButton(
            Buttons.googleDark,
            onPressed: () {
              _showButtonPressDialog(context, 'Google (dark)');
            },
          ),
        ),
        const Divider(),

        // Facebook
        Center(
          child: SignInButton(
            Buttons.facebookNew,
            onPressed: () {
              _showButtonPressDialog(context, 'FacebookNew');
            },
          ),
        ),
        const Divider(),

        // Apple
        Center(
          child: SignInButton(
            Buttons.apple,
            onPressed: () {
              _showButtonPressDialog(context, 'Apple');
            },
          ),
        ),
        const Divider(),
        Center(
          child: SignInButton(
            Buttons.appleDark,
            onPressed: () {
              _showButtonPressDialog(context, 'Apple (dark)');
            },
          ),
        ),
        const Divider(),

        // GitHub
        Center(
          child: SignInButton(
            Buttons.gitHub,
            text: 'Sign up with GitHub',
            onPressed: () {
              _showButtonPressDialog(context, 'Github');
            },
          ),
        ),
        const Divider(),

        // Microsoft
        Center(
          child: SignInButton(
            Buttons.microsoft,
            text: 'Sign up with Microsoft',
            onPressed: () {
              _showButtonPressDialog(context, 'Microsoft');
            },
          ),
        ),
        const Divider(),

        // Twitter / X
        Center(
          child: SignInButton(
            Buttons.twitter,
            text: 'Use Twitter with delay',
            onPressed: () async {
              await Future<void>.delayed(const Duration(seconds: 1));
              if (!context.mounted) return;
              _showButtonPressDialog(context, 'Twitter');
            },
          ),
        ),
        Center(
          child: SignInButton(
            Buttons.x,
            text: 'Use X (Twitter) with delay',
            onPressed: () async {
              await Future<void>.delayed(const Duration(seconds: 1));
              if (!context.mounted) return;
              _showButtonPressDialog(context, 'X');
            },
          ),
        ),
        const Divider(),

        // Email as SignInButton
        Center(
          child: SignInButton(
            Buttons.email,
            onPressed: () {
              _showButtonPressDialog(context, 'Email');
            },
          ),
        ),
        const Divider(),

        // Anonymous
        Center(
          child: SignInButton(
            Buttons.anonymous,
            onPressed: () {
              _showButtonPressDialog(context, 'Anonymous');
            },
          ),
        ),
        const Divider(),

        // LinkedIn
        Center(
          child: SignInButton(
            Buttons.linkedIn,
            onPressed: () {
              _showButtonPressDialog(context, 'LinkedIn');
            },
          ),
        ),
        const Divider(),

        // Pinterest
        Center(
          child: SignInButton(
            Buttons.pinterest,
            onPressed: () {
              _showButtonPressDialog(context, 'Pinterest');
            },
          ),
        ),
        const Divider(),

        // Reddit
        Center(
          child: SignInButton(
            Buttons.reddit,
            onPressed: () {
              _showButtonPressDialog(context, 'Reddit');
            },
          ),
        ),
        const Divider(),

        // Tumblr
        Center(
          child: SignInButton(
            Buttons.tumblr,
            onPressed: () {
              _showButtonPressDialog(context, 'Tumblr');
            },
          ),
        ),
        const Divider(),

        // Quora
        Center(
          child: SignInButton(
            Buttons.quora,
            onPressed: () {
              _showButtonPressDialog(context, 'Quora');
            },
          ),
        ),
        const Divider(),

        // Yahoo
        Center(
          child: SignInButton(
            Buttons.yahoo,
            onPressed: () {
              _showButtonPressDialog(context, 'Yahoo');
            },
          ),
        ),
        const Divider(),

        // Hotmail
        Center(
          child: SignInButton(
            Buttons.hotmail,
            onPressed: () {
              _showButtonPressDialog(context, 'Hotmail');
            },
          ),
        ),
        const Divider(),

        // Xbox
        Center(
          child: SignInButton(
            Buttons.xbox,
            onPressed: () {
              _showButtonPressDialog(context, 'Xbox');
            },
          ),
        ),
        const Divider(),

        // Mini buttons row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SignInButton(
              Buttons.linkedIn,
              mini: true,
              onPressed: () async {
                await Future<void>.delayed(const Duration(seconds: 1));
                if (!context.mounted) return;
                _showButtonPressDialog(context, 'LinkedIn (mini) with delay');
              },
            ),
            SignInButton(
              Buttons.tumblr,
              mini: true,
              onPressed: () {
                _showButtonPressDialog(context, 'Tumblr (mini)');
              },
            ),
            SignInButton(
              Buttons.facebook,
              mini: true,
              onPressed: () {
                _showButtonPressDialog(context, 'Facebook (mini)');
              },
            ),
            SignInButtonBuilder(
              icon: Icons.email,
              text: 'Ignored for mini button',
              mini: true,
              onPressed: () {
                _showButtonPressDialog(context, 'Email (mini)');
              },
              backgroundColor: Colors.cyan,
            ),
            SignInButton(
              Buttons.x,
              mini: true,
              onPressed: () {
                _showButtonPressDialog(context, 'X (mini)');
              },
            ),
          ],
        ),
      ],
    );
  }
}
