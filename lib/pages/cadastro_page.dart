// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_world_skills_prova04/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final Preferences preferences = Preferences();

  register() async {
    final apiUrl = Uri.parse("http://10.196.200.22:3000/alunos");
    final name = nameController.text;
    final city = cityController.text;
    final course = courseController.text;
    final email = emailController.text;
    final pass = passController.text;

    try {
      var response = await http.post(apiUrl,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "nome_completo": name,
            "cidade": city,
            "curso": course,
            "email": email,
            "senha": pass
          }));

      await preferences.setString("nome_completo", name);
      await preferences.setString("cidade", city);
      await preferences.setString("curso", course);
      await preferences.setString("email", email);

      await preferences.getString("email");

      Navigator.pushReplacementNamed(context, "/perfil");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset("./assets/Logo.png"),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == "") {
                      return "Campo obrigatorio";
                    }
                    return null;
                  },
                  controller: nameController,
                  decoration: const InputDecoration(
                      label: Text("Nome Completo"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == "") {
                      return "Campo obrigatorio";
                    }
                    return null;
                  },
                  controller: cityController,
                  decoration: const InputDecoration(
                      label: Text("Cidade"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == "") {
                      return "Campo obrigatorio";
                    }
                    return null;
                  },
                  controller: courseController,
                  enableInteractiveSelection: true,
                  decoration: const InputDecoration(
                      hintText: "Selecione uma opção",
                      suffixIcon: Icon(Icons.arrow_downward),
                      label: Text("Curso"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == "") {
                      return "Campo obrigatorio";
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: const InputDecoration(
                      label: Text("Email"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value == "") {
                      return "Campo obrigatorio";
                    }
                    if (value != confirmPassController.text) {
                      return "As senhas devem ser iguais";
                    }
                    return null;
                  },
                  controller: passController,
                  decoration: const InputDecoration(
                      label: Text("Senha"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  validator: (String? value) {
                    if (value == "") {
                      return "Campo obrigatorio";
                    }

                    if (passController.text != value) {
                      return "As senhas devem ser iguais";
                    }
                    return null;
                  },
                  controller: confirmPassController,
                  decoration: const InputDecoration(
                      label: Text("Confimar senha"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        register();
                      }
                    },
                    child: Container(
                      width: 120,
                      height: 30,
                      alignment: Alignment.center,
                      child: const Text("Cadastrar-se"),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
