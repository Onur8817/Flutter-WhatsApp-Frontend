import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:puan/ColorForApp.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});
  List popUpList = [
    "Yeni Grup",
    "Yeni Toplu Mesaj",
    "Bağlı Cihazlar",
    "Yıldızlı Mesajlar",
    "Ayarlar"
  ];
  static List<Person> persons = List.generate(
      100,
      (index) =>
          Person("Kişi $index", "Son Mesaj Testi", "12.$index", "Merhaba!"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorApp.koyuYesilRenk,
        title: Text("WhatsApp"),
        actions: [
          GestureDetector(
            child: Icon(Icons.camera_alt),
            onTap: null,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.search),
          PopupMenuButton(itemBuilder: (context) {
            return popUpList.map((e) => PopupMenuItem(child: Text(e))).toList();
          }),
        ],
      ),
      body: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      //Ana Ekran
      makeTopBar(),
      Flexible(
          child: ListView.builder(
              itemCount: LoginWidget.persons.length,
              itemBuilder: ((context, index) =>
                  Person.messageSection(context))))
    ]));
  }
}

Widget makeTopBar() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 7),
          child: Icon(
            Icons.group,
            color: Colors.white,
            size: 30,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            child: Text(
              "Sohbetler",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            decoration: BoxDecoration(),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            child: Text(
              "Durum",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            decoration: BoxDecoration(),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            child: Text(
              "Aramalar",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            decoration: BoxDecoration(),
          ),
        ),
      ],
    ),
    decoration: BoxDecoration(color: ColorApp.koyuYesilRenk),
  );
}

class Person {
  String person;
  String lastMessage;
  String hours;
  String unreadMessages;
  Person(this.person, this.lastMessage, this.hours, this.unreadMessages);
  static Widget messageSection(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, "/userChat"),
      leading: CircleAvatar(
        backgroundColor: ColorApp.koyuYesilRenk,
        child: Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
      title: Text("Kişi"),
      subtitle: Text("data"),
      trailing: Container(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Text("12.01"),
            SizedBox(
              height: 6,
            ),
            Container(
                child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      "3",
                      style: TextStyle(color: Colors.white),
                    )),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: ColorApp.cokAcikYesil))
          ],
        ),
      ),
    );
  }
}
