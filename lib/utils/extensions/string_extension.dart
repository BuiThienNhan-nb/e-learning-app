import 'dart:math';

extension RandomString on String {
  String getRandomString(int length) {
    const String chars =
        "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890.!@#\$%^&*()/][";

    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(
          Random().nextInt(chars.length),
        ),
      ),
    );
  }
}
