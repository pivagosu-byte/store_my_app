class TFirebaseAuthException implements Exception {
  final String code;

  const TFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'Аккаунт с этим email уже существует.';
      case 'invalid-email':
        return 'Некорректный адрес электронной почты.';
      case 'weak-password':
        return 'Слишком слабый пароль.';
      case 'user-disabled':
        return 'Этот аккаунт заблокирован.';
      case 'user-not-found':
        return 'Пользователь с таким email не найден.';
      case 'wrong-password':
        return 'Неверный пароль.';
      case 'invalid-credential':
        return 'Неверный email или пароль.';
      case 'too-many-requests':
        return 'Слишком много попыток. Попробуйте позже.';
      case 'network-request-failed':
        return 'Ошибка сети. Проверьте подключение к интернету.';
      default:
        // ШАГ 2: Неизвестный код — показываем технический идентификатор
        return 'Ошибка авторизации: $code';
    }
  }
}
