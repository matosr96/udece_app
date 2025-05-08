import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final nameController = TextEditingController();

  void _showSuccessDialog(String name) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Guardado'),
        content: Text('Hola, $name ha sido registrado.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);
    final authCtrl = ref.read(authProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Bienvenido ${auth.user?['email'] ?? ''}')),
            ListTile(
              title: const Text('Cerrar sesión'),
              onTap: () {
                authCtrl.logout();
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Gestión de usuario', style: TextStyle(fontSize: 18)),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showSuccessDialog(nameController.text);
              },
              child: const Text('Guardar'),
            )
          ],
        ),
      ),
    );
  }
}
