import 'package:flutter/material.dart';
import 'package:project_world_skills_prova04/pages/cadastro_page.dart';
import 'package:project_world_skills_prova04/pages/perfil_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CadastroPage(),
      routes: {
        '/cadastro': (context) => CadastroPage(),
        "/perfil": (context) => PerfilPage()
        // '/perfil': (context) 
      },
    );
  }
}


