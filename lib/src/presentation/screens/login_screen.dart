// lib/src/presentation/screens/login_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udece_app/src/presentation/providers/auth_provider.dart';
import 'package:udece_app/src/presentation/screens/home_screen.dart';

class LoginScreen extends ConsumerWidget {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    final authController = ref.read(authProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar sesión')),
      body: Center(
        // 👈 Centrar el contenido
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        auth.isLoading
                            ? null
                            : () async {
                              try {
                                await authController.login(
                                  emailController.text.trim(),
                                  passController.text.trim(),
                                );

                                final updatedAuth = ref.read(authProvider);

                                if (updatedAuth.user != null) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const HomeScreen(),
                                    ),
                                  );
                                }
                              } catch (_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Credenciales inválidas o error de red',
                                    ),
                                  ),
                                );
                              }
                            },
                    child:
                        auth.isLoading
                            ? const CircularProgressIndicator()
                            : const Text('Iniciar sesión'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
