import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  CadastroPageState createState() => CadastroPageState();
}

class CadastroPageState extends State<CadastroPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController sobrenomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmacaoSenhaController = TextEditingController();

  void cadastrar(BuildContext context) async {
    String nome = nomeController.text;
    String sobrenome = sobrenomeController.text;
    String email = emailController.text;
    String senha = senhaController.text;
    String confirmacaoSenha = confirmacaoSenhaController.text;

    if (email.isNotEmpty && senha.isNotEmpty && confirmacaoSenha.isNotEmpty && nome.isNotEmpty && sobrenome.isNotEmpty) {
      if (senha == confirmacaoSenha) {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: senha,
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Conta criada com sucesso!'),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 3),
            ),
          );

          // Navegar para a homePage após o cadastro
          Navigator.pushReplacementNamed(context, '/home', arguments: nome);

        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erro ao criar conta: $e'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );

          print(context);
          print(e);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('As senhas não coincidem.'),
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
      appBar: AppBar(
        title: const Text('Criar Conta'),
        backgroundColor: const Color(0xFFA06CD5),
      ),
      backgroundColor: const Color(0xFF1A181B),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Crie sua conta",
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
                  controller: nomeController,
                  style: const TextStyle(color: Color(0xFFFFFAFA)),
                  decoration: InputDecoration(
                    hintText: "Nome",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF7D53DE)),
                    ),
                    labelText: 'Nome',
                    labelStyle: const TextStyle(color: Color(0xFF7D53DE)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 340,
                child: TextField(
                  controller: sobrenomeController,
                  style: const TextStyle(color: Color(0xFFFFFAFA)),
                  decoration: InputDecoration(
                    hintText: "Sobrenome",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF7D53DE)),
                    ),
                    labelText: 'Sobrenome',
                    labelStyle: const TextStyle(color: Color(0xFF7D53DE)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                      borderSide: const BorderSide(color: Color(0xFF7D53DE)),
                    ),
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Color(0xFF7D53DE)),
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
                      borderSide: const BorderSide(color: Color(0xFF7D53DE)),
                    ),
                    labelText: 'Senha',
                    labelStyle: const TextStyle(color: Color(0xFF7D53DE)),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 340,
                child: TextField(
                  controller: confirmacaoSenhaController,
                  style: const TextStyle(color: Color(0xFFFFFAFA)),
                  decoration: InputDecoration(
                    hintText: "Confirme sua senha",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF7D53DE)),
                    ),
                    labelText: 'Confirmar Senha',
                    labelStyle: const TextStyle(color: Color(0xFF7D53DE)),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 40),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(const Color(0xFF7D53DE)),
                  minimumSize: WidgetStateProperty.all(const Size(260, 50)),
                ),
                onPressed: () {
                  cadastrar(context);
                },
                child: const Text(
                  "Cadastrar",
                  style: TextStyle(
                    color: Color(0xFFFFFAFA),
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
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
