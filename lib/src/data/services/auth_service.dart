import 'package:dio/dio.dart';
import '../../utils/http_client.dart';

class UserService {
  Future<Map<String, dynamic>> signin(String email, String password) async {
    try {
      final response = await dio.post(
        '/signin',
        data: {'email': email, 'password': password},
      );

      return response.data;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Error al iniciar sesión');
    }
  }
}
