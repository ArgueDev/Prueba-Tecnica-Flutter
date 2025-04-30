import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    final usuarioController = TextEditingController();
    final claveController = TextEditingController();

    Future<void> loguearse() async {
      FocusScope.of(context).unfocus();

      final usuario = usuarioController.text.trim();
      final clave = claveController.text.trim();

      final usuariosDB = await rootBundle.loadString('assets/usuarios.json');

      final List<dynamic> usuarios = jsonDecode(usuariosDB);

      final usuarioEncontrado = usuarios.firstWhere((user) => user['usuario'] == usuario && user['clave'] == clave, orElse: () => null);

      if (usuarioEncontrado != null) {
        context.go('/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuario o contraseña incorrectos'),
            backgroundColor: Colors.red,
          ),
        );
      }

    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1976D2), Color(0xFFBBDEFB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person, size: 100, color: Colors.white),
                const SizedBox(height: 40),
                _buildTextField(
                  icon: Icons.person_outline,
                  hint: 'Usuario',
                  obscure: false,
                  controller: usuarioController, 
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  icon: Icons.lock_outline,
                  hint: 'Contraseña',
                  obscure: true,
                  controller: claveController,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: loguearse,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        color: Color(0xFF1976D2),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required IconData icon,
    required String hint,
    required bool obscure,
    required TextEditingController controller,
  }) {
    
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withAlpha(50),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}