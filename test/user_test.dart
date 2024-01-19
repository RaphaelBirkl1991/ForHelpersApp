import 'package:p12_basic_widgets/domain/entities/user.dart';
import 'package:test/test.dart';

void main() {
  late User user;

  setUp(() {
    user = User(1, true, 123, "Company A");
  });

  test('Benutzer ist standardmäßig im Dienst', () {
    expect(user.duty, isTrue);
  });

  test('Setze den Benutzer außer Dienst', () {
    user.setOffDuty();

    expect(user.duty, isFalse);
  });

  test('Setze den Benutzer wieder in den Dienst', () {
    user.setOffDuty();

    user.setOnDuty();

    expect(user.duty, isTrue);
  });
}
