import 'package:test/test.dart';
import 'package:testing_course_udemy/maths_util.dart';

void main() {
  group('maths functions testing - ', () {
    test('check if adding works correct', () {
      //arrange
      const a = 30;
      var b = 10;

      //act
      var sum = add(a, b);

      //assert
      expect(sum, 40);
    });

    test('check if substraction works correct', () {
      //arrange
      const a = 30;
      var b = 10;

      //act
      var sum = substract(a, b);

      //assert
      expect(sum, 20);
    });

    test('check if multiply works correct', () {
      //arrange
      const a = 30;
      var b = 10;

      //act
      var result = multiply(a, b);

      //assert
      expect(result, 300);
    });
  });
}
