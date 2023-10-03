import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_course_udemy/login_screen.dart';

void main() {
  testWidgets('should have one text field to collect user email',
      (widgetTester) async {
    //arrange
    await widgetTester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));
    //act
    Finder userNameTextField = find.byKey(const ValueKey('email_id'));

    //assert
    expect(userNameTextField, findsOneWidget);
  });

  testWidgets('should have one text field to collect user password',
      (widgetTester) async {
    //arrange
    await widgetTester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));
    //act
    Finder passwordTextField = find.byKey(const ValueKey('password'));

    //assert
    expect(passwordTextField, findsOneWidget);
  });

  testWidgets('should have one login button', (widgetTester) async {
    //arrange
    await widgetTester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));
    //act
    Finder loginButton = find.byType(ElevatedButton);

    //assert
    expect(loginButton, findsOneWidget);
  });

  testWidgets('should have error messages when input fields are empty',
      (widgetTester) async {
    //arrange
    await widgetTester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));
    //act
    Finder loginButton = find.byType(ElevatedButton);
    await widgetTester.tap(loginButton); //simulate tap event
    await widgetTester
        .pumpAndSettle(); //wait for f.ex. animations of UI after 'tap' to complete
    Finder errorText = find.text('Required field');

    //assert
    expect(
        errorText,
        findsNWidgets(
            2)); //find two these widgets, two these texts- 'required field'
  });
  testWidgets(
      'should not have any error messages when input fields are correctly entered',
      (widgetTester) async {
    //arrange
    await widgetTester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));
    //act entering a texts to the form
    Finder email = find.byKey(const ValueKey('email_id'));
    Finder pass = find.byKey(const ValueKey('password'));
    await widgetTester.enterText(email,
        'karo@gmail.com'); //simulate writing e-mail address for the text field
    await widgetTester.enterText(pass, 'password');
    //act a tap event after form
    Finder loginButton = find.byType(ElevatedButton);
    await widgetTester.tap(loginButton); //simulate tap event
    await widgetTester.pumpAndSettle();

    Finder errorText = find.text('Required field');

    //assert
    expect(errorText,
        findsNothing); //find nothing, any error texts- 'required field'
  });
}
