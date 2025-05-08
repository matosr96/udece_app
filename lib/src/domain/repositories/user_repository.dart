import '../entities/user.dart';

// Repositorio para obtener usuarios
abstract class UserRepository {
  // Obtener usuarios
  Future<List<User>> getUsers(); 
}
