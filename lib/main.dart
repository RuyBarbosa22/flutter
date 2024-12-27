import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';
import 'cadastroPage.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => const HomePage(),
        '/cadastro': (context) => const CadastroPage(),
      },
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  void login(BuildContext context) async {
    String email = emailController.text;
    String senha = senhaController.text;

    if (email.isNotEmpty && senha.isNotEmpty) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: senha,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Login realizado!'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
          ),
        );

        // Navegar para a HomePage após o login
        Navigator.pushReplacementNamed(context, '/home', arguments: email);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Erro ao fazer login. Tente novamente.'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Preencha todos os campos para continuar.'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe4c283),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Entre em sua conta",
                style: TextStyle(
                  color: Color(0xFFFFFAFA),
                  fontFamily: "Roboto",
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 340,
                child: TextField(
                  controller: emailController,
                  style: const TextStyle(color: Color(0xFFFFFAFA)),
                  decoration: InputDecoration(
                    hintText: "email@exemplo.com",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF4ec0be)),
                    ),
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Color(0xFFfffafa)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4EC0BE)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 340,
                child: TextField(
                  controller: senhaController,
                  style: const TextStyle(color: Color(0xFFFFFAFA)),
                  decoration: InputDecoration(
                    hintText: "Sua senha",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF4ec0be)),
                    ),
                    labelText: 'Senha',
                    labelStyle: const TextStyle(color: Color(0xFFFFFAFA)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4EC0BE)),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 40),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(const Color(0xFF4ec0be)),
                  minimumSize: WidgetStateProperty.all(const Size(260, 50)),
                ),
                onPressed: () {
                  login(context);
                },
                child: const Text(
                  "Entrar",
                  style: TextStyle(
                    color: Color(0xFFFFFAFA),
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/cadastro');
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Não tem conta? ",
                        style: TextStyle(
                          color: Color(0xFFFFFAFA),
                          fontSize: 16,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "Crie uma!",
                        style: TextStyle(
                          color: Color(0xFF1a3c4c),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
