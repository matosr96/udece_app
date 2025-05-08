import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udece_app/src/data/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userServiceProvider = Provider((ref) => UserService());

class AuthState {
  final Map<String, dynamic>? user;
  final bool isLoading;

  AuthState({this.user, this.isLoading = false});

  AuthState copyWith({
    Map<String, dynamic>? user,
    bool? isLoading,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final UserService _userService;

  AuthNotifier(this._userService) : super(AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true);
    try {
      final user = await _userService.signin(email, password);
      state = state.copyWith(user: user);

      // Guardamos el usuario en el dispositivo
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('userEmail', user['email']); // o guarda el JSON
    } catch (e) {
      rethrow;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userEmail');
    state = AuthState();
  }
}

final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final userService = ref.watch(userServiceProvider);
  return AuthNotifier(userService);
});
