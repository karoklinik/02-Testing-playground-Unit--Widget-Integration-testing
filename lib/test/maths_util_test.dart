import 'package:test/test.dart';
import 'package:testing_course_udemy/maths_util.dart';

void main() {
  test('check if adding works correct', () {
    //arrange
    const a = 30;
    var b = 10;

    //act
    var sum = add(a, b);

    //assert
    expect(sum, 40);
  });
}
