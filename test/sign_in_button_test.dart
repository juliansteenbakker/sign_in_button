import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_button/sign_in_button.dart';

Widget _wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  group('SignInButton - all button types render', () {
    // Buttons that do not support mini mode
    const noMini = {Buttons.google, Buttons.googleDark, Buttons.facebookNew};

    for (final button in Buttons.values) {
      testWidgets('$button renders without error', (tester) async {
        await tester.pumpWidget(
          _wrap(
            SignInButton(
              button,
              onPressed: () {},
            ),
          ),
        );
        expect(find.byType(SignInButton), findsOneWidget);
        // Verify no loading indicator is shown by default
        expect(find.byType(CircularProgressIndicator), findsNothing);
      });

      if (!noMini.contains(button)) {
        testWidgets('$button renders in mini mode', (tester) async {
          await tester.pumpWidget(
            _wrap(
              SignInButton(
                button,
                mini: true,
                onPressed: () {},
              ),
            ),
          );
          expect(find.byType(SignInButton), findsOneWidget);
        });
      }
    }
  });

  group('SignInButton - loading state', () {
    testWidgets('shows loading indicator while async onPressed runs',
        (tester) async {
      await tester.pumpWidget(
        _wrap(
          SignInButton(
            Buttons.google,
            onPressed: () async {
              await Future<void>.delayed(const Duration(seconds: 1));
            },
          ),
        ),
      );

      await tester.tap(find.byType(SignInButton));
      await tester.pump(); // trigger setState

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('ignores second tap while loading', (tester) async {
      var callCount = 0;
      await tester.pumpWidget(
        _wrap(
          SignInButton(
            Buttons.gitHub,
            onPressed: () async {
              callCount++;
              await Future<void>.delayed(const Duration(seconds: 1));
            },
          ),
        ),
      );

      await tester.tap(find.byType(SignInButton));
      await tester.pump();
      await tester.tap(find.byType(SignInButton)); // second tap while loading
      await tester.pumpAndSettle();

      expect(callCount, 1);
    });

    testWidgets('resets loading state after onPressed completes',
        (tester) async {
      await tester.pumpWidget(
        _wrap(
          SignInButton(
            Buttons.apple,
            onPressed: () async {
              await Future<void>.delayed(const Duration(milliseconds: 100));
            },
          ),
        ),
      );

      await tester.tap(find.byType(SignInButton));
      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('custom loadingIndicatorColor is applied', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SignInButton(
            Buttons.gitHub,
            loadingIndicatorColor: Colors.red,
            onPressed: () async {
              await Future<void>.delayed(const Duration(seconds: 1));
            },
          ),
        ),
      );

      await tester.tap(find.byType(SignInButton));
      await tester.pump();

      final indicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      expect(indicator.color, Colors.red);

      await tester.pumpAndSettle();
    });
  });

  group('SignInButton - text override', () {
    testWidgets('shows custom text when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SignInButton(
            Buttons.gitHub,
            text: 'Sign up with GitHub',
            onPressed: () {},
          ),
        ),
      );
      expect(find.text('Sign up with GitHub'), findsOneWidget);
    });
  });

  group('SignInButtonBuilder', () {
    testWidgets('renders text and icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SignInButtonBuilder(
            text: 'Sign in with Email',
            icon: Icons.email,
            backgroundColor: Colors.blueGrey,
            onPressed: () {},
          ),
        ),
      );
      expect(find.text('Sign in with Email'), findsOneWidget);
      expect(find.byIcon(Icons.email), findsOneWidget);
    });

    testWidgets('shows loading indicator when isLoading is true',
        (tester) async {
      await tester.pumpWidget(
        _wrap(
          SignInButtonBuilder(
            text: 'Sign in',
            icon: Icons.email,
            backgroundColor: Colors.blueGrey,
            onPressed: () {},
            isLoading: true,
          ),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Sign in'), findsNothing);
    });

    testWidgets('hides loading indicator when isLoading is false',
        (tester) async {
      await tester.pumpWidget(
        _wrap(
          SignInButtonBuilder(
            text: 'Sign in',
            icon: Icons.email,
            backgroundColor: Colors.blueGrey,
            onPressed: () {},
          ),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Sign in'), findsOneWidget);
    });

    testWidgets('renders mini button without text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SignInButtonBuilder(
            text: 'ignored',
            icon: Icons.email,
            backgroundColor: Colors.cyan,
            onPressed: () {},
            mini: true,
          ),
        ),
      );
      expect(find.byType(SignInButtonBuilder), findsOneWidget);
      expect(find.text('ignored'), findsNothing);
    });

    testWidgets('uses image over icon when both provided', (tester) async {
      const testImage = FlutterLogo(size: 24);
      await tester.pumpWidget(
        _wrap(
          SignInButtonBuilder(
            text: 'Sign in',
            icon: Icons.email,
            image: testImage,
            backgroundColor: Colors.white,
            onPressed: () {},
          ),
        ),
      );
      expect(find.byWidget(testImage), findsOneWidget);
      expect(find.byIcon(Icons.email), findsNothing);
    });
  });

  group('SignInButton - mini mode assertion', () {
    testWidgets('google throws in mini mode', (tester) async {
      expect(
        () => SignInButton(
          Buttons.google,
          mini: true,
          onPressed: () {},
        ),
        throwsAssertionError,
      );
    });

    testWidgets('googleDark throws in mini mode', (tester) async {
      expect(
        () => SignInButton(
          Buttons.googleDark,
          mini: true,
          onPressed: () {},
        ),
        throwsAssertionError,
      );
    });

    testWidgets('facebookNew throws in mini mode', (tester) async {
      expect(
        () => SignInButton(
          Buttons.facebookNew,
          mini: true,
          onPressed: () {},
        ),
        throwsAssertionError,
      );
    });
  });
}
