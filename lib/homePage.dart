import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String nome = ModalRoute.of(context)?.settings.arguments as String? ?? "Usuário";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFFA06CD5),
      ),
      backgroundColor: const Color(0xFF1A181B),
      body: Center(
        child: Text(
          "Bem-vindo de volta, $nome!",
          style: const TextStyle(
            color: Color(0xFFFFFAFA),
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
