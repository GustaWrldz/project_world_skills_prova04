import 'package:flutter/material.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Icon(
                  Icons.trending_up,
                  size: 58,
                ),
                Text("Ranking - Paraná")
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          height: 40,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 12,
                              ),
                              Text("${index + 1} -"),
                              SizedBox(
                                width: 12,
                              ),
                              Icon(Icons.account_circle_outlined),
                              SizedBox(
                                width: 12,
                              ),
                              Text("Aluno ${index + 1}"),
                              SizedBox(
                                width: 180,
                              ),
                              Text("3565pts"),
                            ],
                          ),
                        ),
                      ),
                    );
                  }))
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              width: 20,
            ),
            Container(
              height: 100,
              width: 100,
              child: Image.asset("./assets/Logo.png"),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, "/perfil");
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                height: 100,
                child: Text(
                  "Meu perfil",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.blue[100], border: Border.all(width: 1)),
              child: Text(
                "Ranking",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(color: Colors.white),
              child: Text(
                "Disciplinas",
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 350,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              width: 120,
              child: Row(
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
    );
  }
}
