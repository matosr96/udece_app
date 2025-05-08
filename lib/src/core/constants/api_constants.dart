import 'dart:io';

class ApiConstants {
  static final String baseUrl =
      Platform.isAndroid
          ? 'http://10.0.2.2:8000/api/v1'
          : 'http://localhost:8000/api/v1';
}
