import 'package:flutter/material.dart';
import 'package:project_world_skills_prova04/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final Preferences preferences = Preferences();

  setFields() async {
    final name = await preferences.getString("name");
    final city = await preferences.getString("city");
    final course = await preferences.getString("course");

    print(name);

    setState(() {
      nameController.text = name!;
      cityController.text = city!;
      courseController.text = course!;
    });
  }

  @override
  void initState() {
    setFields();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: const Column(
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    size: 68,
                  ),
                  Text(
                    "Perfil",
                    style: TextStyle(fontSize: 22),
                  )
                ],
              ),
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
              controller: nameController,
              decoration: const InputDecoration(
                  label: Text("Nome Completo"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)))),
            ),
            const SizedBox(
              height: 32,
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
              height: 32,
            ),
            TextFormField(
              enabled: false,
              validator: (value) {
                if (value == "") {
                  return "Campo obrigatorio";
                }
                return null;
              },
              controller: courseController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  label: const Text("Curso"),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)))),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white),
                onPressed: () async {
                  await setFields();
                },
                child: Container(
                  width: 120,
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text("Mudar senha"),
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white),
                onPressed: () {},
                child: Container(
                  width: 120,
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text("Atualizar"),
                )),
          ],
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 100,
                width: 100,
                child: Image.asset("./assets/Logo.png"),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.blue[100], border: Border.all(width: 1)),
                child: const Text(
                  "Meu perfil",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/ranking");
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const Text(
                    "Ranking",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(color: Colors.white),
                child: const Text(
                  "Disciplinas",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 350,
              ),
              Container(
                height: 40,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                width: 120,
                child: const Row(
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Text(
                      "Log Out",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
