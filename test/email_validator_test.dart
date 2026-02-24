import 'package:flutter_test/flutter_test.dart';
import 'package:cyberclub_tournaments/core/utils/app_validators.dart'; // Поправь путь на свой

void main() {
  group('Unit Test: Проверка валидации email', () {
    // Тест 1: Позитивный сценарий
    test('Валидный email должен вернуть true', () {
      // Arrange (Подготовка)
      const email = 'player@cyberclub.com';

      // Act (Действие)
      final result = AppValidators.validateEmail(email);

      // Assert (Проверка)
      expect(result, true);
    });

    // Тест 2: Негативный сценарий (нет домена)
    test('Невалидный email (player.cyberclub) должен вернуть false', () {
      const email = 'player.cyberclub';
      final result = AppValidators.validateEmail(email);
      expect(result, false);
    });

    // Тест 3: Негативный сценарий (нет имени пользователя)
    test('Невалидный email (@com) должен вернуть false', () {
      const email = '@com';
      final result = AppValidators.validateEmail(email);
      expect(result, false);
    });

    // Тест 4: Пустая строка
    test('Пустая строка должна вернуть false', () {
      const email = '';
      final result = AppValidators.validateEmail(email);
      expect(result, false);
    });

    // Тест 5: Null
    test('Null должен вернуть false', () {
      final result = AppValidators.validateEmail(null);
      expect(result, false);
    });
  });
}
