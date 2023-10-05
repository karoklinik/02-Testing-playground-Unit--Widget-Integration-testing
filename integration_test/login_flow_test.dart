import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing_course_udemy/login_screen.dart';

void main() {
  group('Login flow test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets(
        'shows home screen after submit correct entered form', //have to wait for the entire app to run
        (widgetTester) async {
      //arrange
      await widgetTester.pumpWidget(const MaterialApp(
        home: LoginScreen(),
      ));
      //ACT entering a texts to the form
      Finder email = find.byKey(const ValueKey('email_id'));
      Finder pass = find.byKey(const ValueKey('password'));
      await widgetTester.enterText(email,
          'karo@gmail.com'); //simulate writing e-mail address for the text field
      await widgetTester.enterText(pass, 'password');
      //act a tap event after form
      Finder loginButton = find.byType(ElevatedButton);
      await widgetTester.tap(loginButton); //simulate tap event
      await widgetTester.pumpAndSettle();

      Finder homeScreenText =
          find.byType(Text); //login screen doesnt have a text widget

      //ASSERT
      expect(homeScreenText, findsOneWidget);
    });
    testWidgets('shows error messages after submit empty form',
        (widgetTester) async {
      //arrange
      await widgetTester.pumpWidget(const MaterialApp(
        home: LoginScreen(),
      ));
      //act a tap event with empty form
      Finder loginButton = find.byType(ElevatedButton);
      await widgetTester.tap(loginButton); //simulate tap event
      await widgetTester.pumpAndSettle();

      Finder errorText = find.text('Required Field');

      //ASSERT
      expect(errorText, findsNWidgets(2));
    });
  });
}
